class CreateUniversityMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :university_messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end
