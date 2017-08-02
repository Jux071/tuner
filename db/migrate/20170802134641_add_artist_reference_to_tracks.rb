class AddArtistReferenceToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :artists, :tracks, foreign_key: true, index: true
  end
end
