class AlterUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.integer   :uid
      t.string    :first_name
      t.string    :last_name
      t.string    :link
      t.string    :username
      t.string    :gender
      t.integer   :timezone
      t.string    :locale
      t.timestamp :updated_time
    end
  end

  def down
    drop_table :users
  end
end
