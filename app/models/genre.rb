class Genre < ApplicationRecord
	belongs_to :user

	has_many :tracks, dependent: :destroy

	validates :name, presence: true, length: { maximum: 30 }
end