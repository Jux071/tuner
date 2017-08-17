class Playlist < ApplicationRecord
	has_one :user

	has_many :playlist_tracks, dependent: :destroy
	has_many :tracks, through: :playlist_tracks
	#has_many :track_playlists, through: :playlist_track, source: :track

	#accepts_nested_attributes_for :tracks, allow_destroy: true

	validates :name, presence: true, length: { maximum: 30 }
end