require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save restaurant without title" do
    restaurant = Restaurant.new
    assert = !restaurant.save, "Saved restaurant without a title"
  end

end