class Restaurant < ActiveRecord::Base 
  validates :name, :presence => true
  has_many  :ratings

  attr_accessible :name, :location, :yelp_id

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? OR id LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
