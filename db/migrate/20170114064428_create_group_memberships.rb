class CreateGroupMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :group_memberships do |t|
      t.integer  "user_id"
      t.integer  "group_id"
      t.integer "role_id"
      t.timestamps
    end
    add_index :group_memberships, :user_id
    add_index :group_memberships, :group_id
    add_index :group_memberships, :role_id
    add_index :group_memberships, [:user_id, :group_id], unique: true
  end
end