class AddGenresReferenceToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :tracks, :genre, foreign_key: true, index: true
  end
end
