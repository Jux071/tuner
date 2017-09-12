class AlbumsController < ApplicationController
	before_action :authorize_for_users
	
	def index
		@albums = Album.search(params[:search])
	end
	
	def show
		@album = Album.find(params[:id])
		@tracks = @album.tracks
	end

end