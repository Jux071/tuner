class AddUserReferenceToPlaylists < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :playlists, foreign_key: true, index: true
  end
end
