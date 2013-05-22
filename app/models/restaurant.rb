class Restaurant < ActiveRecord::Base 
  validates :name, :presence => true
  has_many  :ratings#, :categories

  attr_accessible :name, :location, :yelp_id

  def self.search(search)
    find(:all,
         :conditions => ['name LIKE ?',#' OR category LIKE ?',
                         #"%#{search}%",
                         "%#{search}%"])
  end

  def average_rating
    @rating = 0
    self.ratings.each do | rating |
      @rating = @rating + rating.rating
    end
    @rating.to_f / self.ratings.size.to_f
  end
end
