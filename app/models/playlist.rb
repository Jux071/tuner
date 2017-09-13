class Playlist < ApplicationRecord
	has_one :user

	has_many :playlist_tracks, dependent: :destroy
	has_many :tracks, through: :playlist_tracks

	validates :name, presence: true, length: { maximum: 30 }
end