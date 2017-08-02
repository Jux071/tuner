class Tracks < ApplicationRecord
	belongs_to :artists
	belongs_to :genres
	belongs_to :albums
end