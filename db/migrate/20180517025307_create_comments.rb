class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, force: :cascade  do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :micropost_id, null: false

      t.timestamps
    end
  end
end
