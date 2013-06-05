class Tag < ActiveRecord::Base
	belongs_to :restaurant
	attr_accessible :tag
end
