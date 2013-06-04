class ChangeDataTypeForUserUid < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  	  t.change :uid, :integer, :limit => 8
  	end
  end

  def down
  	change_table :users do |t|
  	  t.change :uid, :integer, :limit => 4
  	end
  end
end
