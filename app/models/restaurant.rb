class Restaurant < ActiveRecord::Base 
  validates :name, :presence => true
  has_many  :ratings #, :categories

  attr_accessible :id,  :name, :location, :yelp_id

  def self.search(search)
    find(:all,
         :conditions => ['name LIKE ?',#' OR category LIKE ?',
                         #"%#{search}%",
                         "%#{search}%"])
  end
end
