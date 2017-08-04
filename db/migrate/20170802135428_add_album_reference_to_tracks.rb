class AddAlbumReferenceToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :tracks, :album, foreign_key: true, index: true
  end
end
