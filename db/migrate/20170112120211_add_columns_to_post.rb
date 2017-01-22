class AddColumnsToPost < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :postable_type, :string
    add_column :posts, :postable_id, :integer
  end
   def down
    remove_column :posts, :postable_type, :string
    remove_column :posts, :postable_id, :integer
  end
end
