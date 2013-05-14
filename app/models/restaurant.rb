class Restaurant < ActiveRecord::Base
  has_many  :ratings

  attr_accessible :name, :location, :yelp_id
end
