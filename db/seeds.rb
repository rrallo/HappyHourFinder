# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all

[["South Beach Bar & Grill", "Ocean Beach", 3, "south-beach-bar-and-grille-san-diego"]].each do |n,l,r, y|
	Restaurant.find_or_create_by_name name: n, location: l, rating: r, yelp_id: y
end