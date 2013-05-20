class CreateUsers < ActiveRecord::Migration
  def up 
    create_table :users do |t|
      # email is added by the devise gem
      t.integer   :id
      t.string    :name
      t.string    :first_name
      t.string    :last_name
      t.string    :link
      t.string    :username
      t.string    :gender
      t.integer   :timezone
      t.string    :locale
      t.timestamp :updated_time

      t.string    :location
    end
  end

  def down
    drop_table :users
  end
end
