class CreateGroupMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :group_messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
