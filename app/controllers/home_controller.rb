class HomeController < ApplicationController

	def index
		@title = 'Welcome to Tuner'
		@albums = Album.all
	end

end