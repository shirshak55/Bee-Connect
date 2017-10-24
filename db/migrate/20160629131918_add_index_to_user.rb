class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :user_name,unique: true
  end
end
