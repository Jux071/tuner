class AddLinkToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_column :tracks, :link, :string
  end
end
