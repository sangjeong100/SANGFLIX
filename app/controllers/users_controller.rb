class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage;end
  
  def update
    current_user.update user_params
  end 

  private 

  def user_params
    params.require(:user).permit(User::USER_COLUMNS)
  end 
end


