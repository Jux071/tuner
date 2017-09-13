class Artist < ApplicationRecord
	belongs_to :user

	has_many :albums, dependent: :destroy
	has_many :tracks, dependent: :destroy

	validates :name, presence: true, length: { maximum: 35 }

	def self.search(search)
		where("name LIKE ?", "%#{search}%") 
	end
	
end