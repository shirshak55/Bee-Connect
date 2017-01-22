class AddIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :user_name,unique: true
  end
end
