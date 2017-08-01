class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	has_secure_password

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
		update.attribute(:remember_digest, User.digest(remember_token))		
	end

	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)		
	end

	def admin?
		role == ROLE_ADMIN
	end

	def superadmin?
		role == ROLE_SUPERADMIN
	end
end