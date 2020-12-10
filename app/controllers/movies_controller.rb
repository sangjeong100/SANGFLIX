class MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :load_object, only: %i(show edit update destroy)


  def index;end

  def show;end 


  #찜하기 버튼을 눌렀을 때
  def toggle_like 

    #찜 상태 확인
    movie_queue_sql = 
      'SELECT `movie_queues`.* 
      FROM `movie_queues` 
      WHERE `movie_queues`.`user_id` = ' + String(current_user.id) +
      ' AND `movie_queues`.`movie_id` = ' + params[:id]

    @user_movie_queue_in_this = ActiveRecord::Base.connection.exec_query(movie_queue_sql)
    puts @user_movie_queue_in_this
    if @user_movie_queue_in_this.empty?
      sql = 'INSERT INTO `movie_queues` (`user_id`, `movie_id`, `created_at`, `updated_at`) VALUES ( '+String(current_user.id)+', '+params[:id]+', now(), now())'
      ActiveRecord::Base.connection.exec_query(sql)
      #current_user.movie_queues.create(movie_id: params[:id])
    else
      sql = 'DELETE FROM `movie_queues` WHERE `movie_queues`.`movie_id` = ' + params[:id] + ' AND `movie_queues`.`user_id` = ' + String(current_user.id)
      ActiveRecord::Base.connection.exec_query(sql)
      #@movie_queue.first.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private 

  #movie show 페이지 진입
  def load_object 

    @data = Movie.find_by(id: params[:id])

    select_movie_sql = 'SELECT `movies`.* FROM `movies` WHERE `id` = ' + params[:id]+' LIMIT 1'
    @movie = ActiveRecord::Base.connection.exec_query(select_movie_sql)[0]

    select_actor_appear_movies_sql = 
      'SELECT 
            `actor_appear_movies`.*, 
            `actors`.`actor_name` 
      FROM `actor_appear_movies`, `actors` 
      WHERE `movie_id` = ' + params[:id] + 
      ' AND `actors`.`id` = `actor_appear_movies`.`actor_id` '
    @actors_of_movie = ActiveRecord::Base.connection.exec_query(select_actor_appear_movies_sql)


    #찜 상태 확인
    movie_queue_sql = 
      'SELECT `movie_queues`.* 
      FROM `movie_queues` 
      WHERE `movie_queues`.`user_id` = ' + String(current_user.id) +
      ' AND `movie_queues`.`movie_id` = ' + params[:id]

    @user_movie_queue = ActiveRecord::Base.connection.exec_query(movie_queue_sql)

  end
  
  def search;end
  
  private

  def movie_params
    params.require(:movie).permit(:movie_name, :movie_type, :movie_description, :age_limit, :rating, :number_of_copies, :image, :video)
  end
end
