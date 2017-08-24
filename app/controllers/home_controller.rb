class HomeController < ApplicationController

	def index
		@title = 'Welcome to Tuner'
		@tracks = Track.all.order('created_at ASC').paginate(:page => 1, :per_page => 2)
	end

	def show
		
	end

end