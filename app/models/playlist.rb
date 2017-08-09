class Playlist < ApplicationRecord
	has_one :user

	has_many :playlist_tracks
	has_many :tracks, through: :playlist_tracks, source: :track
	#has_many :track_playlists, through: :playlist_track, source: :track

	validates :name, presence: true, length: { maximum: 30 }
end