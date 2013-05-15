class Restaurant < ActiveRecord::Base 
  validates :name, :presence => true
  has_many  :ratings

  attr_accessible :name, :location, :yelp_id

end
