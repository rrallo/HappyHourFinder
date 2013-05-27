class AlterAuthentications < ActiveRecord::Migration
  def up
    change_table :authentications do |t|
      t.string :token_secret
    end
  end

  def down
    remove_column :token_secret
  end
end
