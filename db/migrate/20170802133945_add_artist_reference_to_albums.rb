class AddArtistReferenceToAlbums < ActiveRecord::Migration[5.1]
  def change
  	add_reference :albums, :artists, foreign_key: true, index: true
  end
end
