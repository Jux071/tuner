class Track < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :album
	belongs_to :user

	has_many :favorited_by, through: :favorites, source: :users

	has_many :playlist_tracks
	has_many :playlists, through: :playlist_tracks

	validates_presence_of :name, :duration
	validates_length_of :name, maximum: 30

	def self.search(search)
		where("name LIKE ?", "%#{search}%") 
	end

	
	
end