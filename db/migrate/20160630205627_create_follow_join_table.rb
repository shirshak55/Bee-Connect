class CreateFollowJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table 'follows' do |t|
      t.integer 'following_id', :null => false
      t.integer 'follower_id', :null => false

      t.timestamps null: false
    end

    add_index :follows, :following_id
    add_index :follows, :follower_id
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
