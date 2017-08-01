class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
    	t.string :name, null: false
    	t.string :duration
    	t.timestamps
    end
  end
end
