class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage;end
  
  def update
    #plan_date 없으면 한달뒤 등록

    if current_user.plan_date.nil? 
      params = user_params.merge(plan_date: Time.now ) 
      current_user.update params
    else
      current_user.update user_params
    end
    
  end 

  private 

  def user_params
    params.require(:user).permit(User::USER_COLUMNS)
  end 
end


