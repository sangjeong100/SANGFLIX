class ActorAppearMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
end
