class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Logged in successfully!'
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
				
			if current_user.admin?
			redirect_to admin_dashboard_path
		elsif current_user.superadmin?
			redirect_to superadmin_dashboard_path
		else
			redirect_to root_path
		end
		else
			flash.now[:error] = 'Invalid username or password!'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_path		
	end
end