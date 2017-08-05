class Album < ApplicationRecord
	belongs_to :artist
	belongs_to :user
	belongs_to :genre

	has_many :tracks, dependent: :destroy

	validates :title, presence: true, length: { maximum: 30 }
	validates_length_of :released, maximum: 4, numericality: true
end