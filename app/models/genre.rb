class Genre < ApplicationRecord
	belongs_to :user

	has_many :tracks, dependent: :destroy
	has_many :albums, dependent: :destroy

	validates :name, presence: true, length: { maximum: 30 }
end