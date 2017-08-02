class AddGenresReferenceToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :genres, :tracks, foreign_key: true, index: true
  end
end
