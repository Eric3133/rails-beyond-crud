class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # if i have a restaurant, i can do restaurant.reviews
end
