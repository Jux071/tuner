class HomeController < ApplicationController

	def index
		@title = 'Welcome to Tuner'
		@tracks = Track.paginate(:page => params[:page], :per_page => 10)
	end

	def show
		
	end

end