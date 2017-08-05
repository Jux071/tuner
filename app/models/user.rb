class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

	has_many :playlists, dependent: :destroy
	has_many :favorites
	has_many :favorite_songs, through: :favorites, source: :track
	has_many :albums
	has_many :artists
	has_many :genres
	has_many :tracks

	validates_uniqueness_of :username, :email

	ROLE_USER = 0
	ROLE_ADMIN = 1
	ROLE_SUPERADMIN = 2

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)		
	end

	def User.new_token
		SecureRandom.urlsafe_base64		
	end

	def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)		
	end


	def forget
    update_attribute(:remember_digest, nil)
  end

	def admin?
		role == ROLE_ADMIN
	end

	def superadmin?
		role == ROLE_SUPERADMIN
	end
end