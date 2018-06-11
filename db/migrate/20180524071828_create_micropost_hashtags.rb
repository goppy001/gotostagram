class CreateMicropostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_hashtags, id: false  do |t|
      t.reference :micropost_id, index: true, foreign_key: true
      t.reference :hashtag_id, index: true, foreign_key: true
    end
  end
end
