class AddApprovedFlagToRestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants, :is_approved, :boolean, :default => false
    Restaurant.all.each do |restaurant|
      restaurant.update_attributes!(:is_approved => true)
    end
  end
end
