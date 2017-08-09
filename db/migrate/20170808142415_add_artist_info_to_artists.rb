class AddArtistInfoToArtists < ActiveRecord::Migration[5.1]
  def change
  	add_column :artists, :artist_info, :text
  end
end
