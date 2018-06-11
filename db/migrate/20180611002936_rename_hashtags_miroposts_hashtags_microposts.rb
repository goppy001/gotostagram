class RenameHashtagsMiropostsHashtagsMicroposts < ActiveRecord::Migration[5.2]
  def change
    rename_table :hashtags_miroposts, :hashtags_microposts
  end
end
