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
    remove_column :uid, :first_name, :last_name, :link, :username, :gender,
                  :timezone, :locale, :updated_time
  end
end
