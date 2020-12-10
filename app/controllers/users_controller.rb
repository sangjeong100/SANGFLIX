class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage;end
  
  def update
    current_user.update user_params
    redirect_back(fallback_location: root_path)
  end 

  private 

  def user_params
    params.require(:user).permit(User::USER_COLUMNS)
  end 
end


