class CreateRestaurants < ActiveRecord::Migration
  def up
  	create_table 'restaurants' do |r|
  		r.string :name
  		r.string :location
  		r.references :photos
  		r.integer :rating
      r.string :yelp_id
  	end
  end

  def down
  	drop_table 'restaurants'
  end
end
