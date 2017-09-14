class ChangeDefaultCoverForAlbums < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :albums, :cover, 'https://riversideband.pl/images/rs/covers/nocover.jpg'
  end
end
