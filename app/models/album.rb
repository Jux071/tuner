class Album < ApplicationRecord
	belongs_to :artist
	belongs_to :user
	belongs_to :genre

	has_many :tracks, dependent: :destroy

	validates :title, presence: true, length: { maximum: 30 }
	validates :released, presence: true, length: { maximum: 4 }, numericality: true

	scope :top5, -> { order(created_at: :desc) }

	def self.search(search)
		where("title LIKE ?", "%#{search}%") 
	end

end