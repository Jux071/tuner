class Artist < ApplicationRecord
	has_many :albums, dependent: :destroy
	has_many :tracks, dependent: :destroy
end