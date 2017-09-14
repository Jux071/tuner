class ArtistsController < ApplicationController
	before_action :authorize_for_users

	def index
		@artist = Artist.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@artist = Artist.find(params[:id])
		@tracks = @artist.tracks.limit(10)
		@albums = @artist.albums
	end

end