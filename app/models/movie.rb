class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :actor_appear_movies, dependent: :destroy
  has_many :movie_queues, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :actors, through: :actor_appear_movies, source: :actor
  
  def main_actors
    self.actors.joins(:actor_appear_movies).where("actor_appear_movies.actor_role = ?", "주연")
  end

  def sub_actors
    self.actors.joins(:actor_appear_movies).where("actor_appear_movies.actor_role = ?", "조연")
  end

  MOVIE_TYPE = ['코미디', '드라마', '액션', '해외드라마']  
end
