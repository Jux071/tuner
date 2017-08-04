class Playlist < ApplicationRecord
	belongs_to :user

	has_many :playlist_songs
	has_many :song_lists, through: :playlist_songs, source: :track

	validates :name, presence: true, length: { maximum: 30 }
end