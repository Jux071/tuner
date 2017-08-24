class Superadmin::BaseController < ApplicationController
	before_action :authorize_for_admins
end