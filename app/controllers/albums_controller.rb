class AlbumsController < ApplicationController
	before_action :authorize
	before_action :find_album, { only: [:show] }
	
	def index
		@albums = Album.all
	end
	
	def show
		@tracks = @album.tracks
	end
	
	private

	def find_album
		@album = Album.find(params[:id])
	end

end