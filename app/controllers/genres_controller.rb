class GenresController < ApplicationController
	before_action :authorize_for_users

	def index
		@genre = Genre.all
		@albums = Album.all
	end

	def show
		@genre = Genre.find(params[:id])
		@tracks = @genre.tracks
	end

end
