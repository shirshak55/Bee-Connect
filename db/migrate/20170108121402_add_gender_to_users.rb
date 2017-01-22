class AddGenderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_female, :boolean, default: false
  end
end
