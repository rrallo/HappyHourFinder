class Restaurant < ActiveRecord::Base 
  validates :name, :presence => true
  has_many  :ratings #, :categories
  has_many  :reviews
  has_many  :tags

  attr_accessible :id, :name, :location, :yelp_id, :photo_url, :is_approved

  def approved?
    is_approved
  end

  def self.search(search)
    find(:all,
         :conditions => ['lower(name) LIKE ?',
                         "%#{search}%".downcase])
  end
  
  def average_rating
    @rating = 0
    self.ratings.each do | rating |
      @rating = @rating + rating.rating
    end
    @rating.to_f / self.ratings.size.to_f
  end
end
