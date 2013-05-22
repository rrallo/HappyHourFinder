class Rating < ActiveRecord::Base
  validates :rating, :presence => true
  belongs_to  :user
  belongs_to  :restaurant

  attr_accessible :rating, :user, :restaurant, :user_id, :restaurant_id
end
