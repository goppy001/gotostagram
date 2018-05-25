class CreateMicropostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_hashtags do |t|
      t.integer :micropost_id
      t.integer :hashtag_id

      t.timestamps
    end
    add_index :micropost_hashtags, :micropost_id
    add_index :micropost_hashtags, :hashtag_id
    add_index :micropost_hashtags, [:micropost_id,:hashtag_id],unique: true
  end
end
