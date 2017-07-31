class User < ApplicationRecord
	has_secure_password

	ROLE_USER = 0
	ROLE_ADMIN = 1
	ROLE_SUPERADMIN = 2

	def admin?
		role == ROLE_ADMIN
	end

	def superadmin?
		role == ROLE_SUPERADMIN
	end
end