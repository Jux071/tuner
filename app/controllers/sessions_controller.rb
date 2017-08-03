class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(username: params[:username])

		if user && user.authenticate(params[:password])
			flash[:notice] = 'Logged in successfully!'
			log_in user
			
			if current_user.admin?
			redirect_to admin_dashboard_path
		else
			redirect_to root_path
		end
		else
			flash.now[:danger] = 'Invalid username or password'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_path		
	end
end