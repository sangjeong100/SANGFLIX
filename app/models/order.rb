class Order < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum return_status: %i(rented returned)
end
