class Album < ApplicationRecord
	belongs_to :artists

	has_many :tracks, dependent: :destroy

	validates_length_of :released, maximum: 4
end