class CreateReviews < ActiveRecord::Migration
  def up 
    create_table :reviews do |t|
      t.string :review
      t.references :user
      t.references :restaurant
    end
  end

  def down
    drop_table :reviews  
  end
end
