class AddArtistReferenceToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :tracks, :artist, foreign_key: true, index: true
  end
end
