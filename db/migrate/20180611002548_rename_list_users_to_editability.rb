class RenameListUsersToEditability < ActiveRecord::Migration[5.2]
  def change
    rename_table :micropost_hashtags, :hashtags_microposts
  end
end
