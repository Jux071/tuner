class HomeController < ApplicationController

	def index
		@title = 'Welcome to Tuner'
		@tracks = Track.all.order('created_at ASC')
	end

end