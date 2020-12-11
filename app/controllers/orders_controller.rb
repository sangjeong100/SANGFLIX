class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :load_object, only: %i(update)

  def index
    @orders = current_user.orders
  end
  
  def create

    if current_user.account_type == nil 
      @msg = "You must set the account type to place an order."
    
    elsif current_user.account_number == nil
      @msg = "You must set an account number to place an order."
    else  

      #order 개수 2회 넘게 불가
      total_order_count = current_user.orders.rented.count

      if current_user.account_type == "twice_a_month_pass" #0값
        #월 2회
        @msg = "You have exceeded the number of movies you can rent per month!"
        if (count = current_user.total_monthly_order) < 2 && total_order_count < 2
          current_user.orders.rented.create(movie_id: params[:movie_id])
          current_user.update(total_monthly_order: count + 1)
          movie_copies_count = (movie = Movie.find_by(id: params[:movie_id])).number_of_copies
          movie.update(number_of_copies: movie_copies_count + 1)
          @msg = "You have successfully rented a movie!"
        end 
      else
        #무제한
        count = current_user.total_monthly_order
        @msg = "You can only rent up to 2 movies at the same time."
        if total_order_count < 2
          current_user.orders.rented.create(movie_id: params[:movie_id])
          current_user.update(total_monthly_order: count + 1)
          movie_copies_count = (movie = Movie.find_by(id: params[:movie_id])).number_of_copies
          movie.update(number_of_copies: movie_copies_count + 1)
          @msg = "You have successfully rented a movie!"
        end
      end 
    end 

    flash[:notice] = @msg
    redirect_back(fallback_location: root_path)
  end

  def update_status
    @order = current_user.orders.rented.where(movie_id: params[:movie_id]).first
    @order.update(return_status: params[:return_status], return_date: Time.now)

    flash[:notice] = "The movie has been returned!"
    redirect_back(fallback_location: root_path)
  end 

  def update
    #별점 주기
    @order.update(rating: params.dig(:order, :rating))

    give_star_order_sql = '
      UPDATE orders
      SET rating = CONVERT(' + params.dig(:order, :rating)  +',decimal(4,2))
      WHERE orders.id = ' + String(@order.id) + '
        AND orders.return_status = 1' 
    give_star_movie_sql = '
      UPDATE movies
      SET rating = (SELECT avg(rating) FROM orders WHERE orders.movie_id = ' + String(@order.movie.id) + ' AND orders.rating <> 0.0 AND orders.return_status = 1)
      WHERE movies.id = ' + String(@order.movie.id)

    ActiveRecord::Base.connection.exec_query(give_star_order_sql)
    ActiveRecord::Base.connection.exec_query(give_star_movie_sql)

    flash[:notice] = "Success in giving a star"
    redirect_back(fallback_location: orders_path)
  end

  private

  def load_object
    @order = Order.find_by(id: params[:id])
  end 

  def order_params
    params.require(:order).permit(:user_id, :movie_id, :return_status, :rating) 
  end 
end
