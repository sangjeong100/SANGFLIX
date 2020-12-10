class Actor < ApplicationRecord
  has_many :actor_appear_movies, dependent: :destroy
  
  ACTOR_TYPE = ['주연', '조연']  
end
