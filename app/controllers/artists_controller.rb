class ArtistsController < ApplicationController
	before_action :authorize_for_users
	before_action :find_artist, { only: [:show]}

	def index
		@artist = Artist.all
	end

	def show
		@tracks = @artist.tracks.limit(10)
	end

	private

	def find_artist
		@artist = Artist.find(params[:id])
	end

end