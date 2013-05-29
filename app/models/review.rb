class Review < ActiveRecord::Base
  validates :review, :presence => true
  belongs_to :user
  belongs_to :restaurant

  attr_accessible :review, :user, :restaurant
end
