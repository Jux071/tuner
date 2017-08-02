class Album < ApplicationRecord
	belongs_to :artists

	has_many :tracks, dependent: :destroy
end