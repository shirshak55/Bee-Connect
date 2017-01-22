class AddIndexingToPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts,[:postable_id,:postable_type]
  end
end
