# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all

[
    [
        "South Beach Bar & Grill", 
        "Ocean Beach", 
        "south-beach-bar-and-grille-san-diego", 
        "https://s3-us-west-1.amazonaws.com/happyapp/images/south_beach_bar_%26_grill.jpg"
    ],
    [
        "Blue Water Seafood", 
        "San Diego", 
        "blue-water-seafood-market-and-grill-san-diego", 
        "https://s3-us-west-1.amazonaws.com/happyapp/images/blue_water_seafood.jpg"
    ],
    [
        "La Puerta",
        "Gaslamp",
        "la-puerta-san-diego",
        ""
    ],
    [
        "West Coast Tavern",
        "North Park",
        "west-coast-tavern-san-diego",
        ""
    ],
    [
        "Jake's on 6th A Wine Bar",
        "Hillcrest",
        "jakes-on-6th-a-wine-bar-san-diego",
        ""
    ],
    [
        "TGI Friday's",
        "UCSD",
        "tgi-fridays-la-jolla",
        ""
    ],
    [
        "Rock Bottom",
        "UCSD",
        "rock-bottom-brewmaster-dinners-san-diego",
        ""
    ],
    [
        "Karl Strauss",
        "UCSD",
        "karl-strauss-brewing-company-san-diego",
        ""
    ],
    [
        "Ortega's Bistro",
        "Hillcrest",
        "ortegas-mexican-bistro-san-diego-2",
        ""
    ]
].each do |n,l,y,p|
	Restaurant.find_or_create_by_name name: n, location: l, yelp_id: y, photo_url: p
end