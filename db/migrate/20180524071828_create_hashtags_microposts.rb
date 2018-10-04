class CreateHashtagsMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_microposts, id: false  do |t|
      t.references :micropost, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
