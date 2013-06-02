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
        3, 
        "south-beach-bar-and-grille-san-diego", 
        "https://s3-us-west-1.amazonaws.com/happyapp/images/south_beach_bar_%26_grill.jpg"
    ],
    [
        "Blue Water Seafood", 
        "San Diego", 
        2, 
        "blue-water-seafood-market-and-grill-san-diego", 
        "https://s3-us-west-1.amazonaws.com/happyapp/images/blue_water_seafood.jpg"
    ],
    [
        "La Puerta",
        "Gaslamp",
        2,
        "la-puerta-san-diego",
        ""
    ],
    [
        "West Coast Tavern",
        "North Park",
        2,
        "west-coast-tavern-san-diego",
        ""
    ],
    [
        "Jake's on 6th A Wine Bar",
        "Hillcrest",
        3,
        "jakes-on-6th-a-wine-bar-san-diego",
        ""
    ],
    [
        "TGI Friday's",
        "UCSD",
        1,
        "tgi-fridays-la-jolla",
        ""
    ],
    [
        "Rock Bottom",
        "UCSD",
        2,
        "rock-bottom-brewmaster-dinners-san-diego",
        ""
    ],
    [
        "Karl Strauss",
        "UCSD",
        4,
        "karl-strauss-brewing-company-san-diego",
        ""
    ],
    [
        "Ortega's Bistro",
        "Hillcrest",
        4,
        "ortegas-mexican-bistro-san-diego-2",
        ""
    ]
].each do |n,l,r, y, p|
	Restaurant.find_or_create_by_name name: n, location: l, rating: r, yelp_id: y, photo_url: p
end