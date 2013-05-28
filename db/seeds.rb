# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all

[["South Beach Bar & Grill", "Ocean Beach", 3, "south-beach-bar-and-grille-san-diego", "https://s3-us-west-1.amazonaws.com/happyapp/images/south_beach_bar_%26_grill.jpg"],
 ["Blue Water Seafood", "San Diego", 2, "blue-water-seafood-market-and-grill-san-diego", "https://s3-us-west-1.amazonaws.com/happyapp/images/blue_water_seafood.jpg"]].each do |n,l,r, y, p|
	Restaurant.find_or_create_by_name name: n, location: l, rating: r, yelp_id: y, photo_url: p
end