class CreatePlaylistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_tracks do |t|
    	t.references :playlist, index: true, foreign_key: true
    	t.references :track, index: true, foreign_key: true
    	t.timestamps
    end
  end
end