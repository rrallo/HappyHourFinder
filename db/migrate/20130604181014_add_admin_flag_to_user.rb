class AddAdminFlagToUser < ActiveRecord::Migration
  def change
  	add_column :users, :is_admin, :boolean, :default => false
    User.all.each do |user|
      user.update_attributes!(:is_admin => false)
    end
  end
end
