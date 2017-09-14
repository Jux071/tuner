class AlbumsController < ApplicationController
	before_action :authorize_for_users
	
	def index
		@albums = Album.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end
	
	def show
		@album = Album.find(params[:id])
		@tracks = @album.tracks
	end

end