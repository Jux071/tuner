class Superadmin::BaseController < ApplicationController
	before_action :authorize_for_superadmins
end