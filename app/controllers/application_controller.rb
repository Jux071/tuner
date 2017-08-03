class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def logged_in?
  	current_user
  end

  helper_method :logged_in?

  def admin?
  	current_user.role == 1
  end

  helper_method :admin?

  def authorize
  	redirect_to new_session_path unless current_user
  	
  end

  def authorize_for_admins
  	unless current_user.admin?
  		flash[:notice] = 'Unauthorized access, you shall not pass!'
      redirect_to root_path
    end
end
end
