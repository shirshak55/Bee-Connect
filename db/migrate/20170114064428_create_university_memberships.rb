class CreateUniversityMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :university_memberships do |t|
      t.integer  "user_id"
      t.integer  "university_id"
      t.integer "role_id"
      t.timestamps
    end
    add_index :university_memberships, :user_id
    add_index :university_memberships, :university_id
    add_index :university_memberships, :role_id
    add_index :university_memberships, [:user_id, :university_id], unique: true
  end
end