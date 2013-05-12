class CreateRestaurants < ActiveRecord::Migration
  def up
  	create_table 'restaurants' do |r|
  		r.string :name
  		r.string :location
  		r.references :photos
  		r.integer :rating
  	end
  end

  def down
  	drop_table 'restaurants'
  end
end
