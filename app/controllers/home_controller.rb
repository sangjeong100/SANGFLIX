class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_movie_queues = current_user.movie_queues.order(created_at: :desc) if current_user.present?
  end
end
