class ArtistsController < ApplicationController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy]}

	def index
		@artist = Artist.all
		@albums = Album.all
	end

	def new
		@artist = Artist.new		
	end

	def create
		@artist = Artist.new(artist_params)

		if @artist.save
			flash[:success] = 'Artist created successfully'
			redirect_to artists_path
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @artist.update(artist_params)
			redirect_to artists_path
		else
			render :edit
		end
	end

	def show
		@tracks = @artist.tracks
	end

	def destroy
		if @artist.user_id = current_user.user_id
			@artist.destroy
			flash[:success] = "Artist deleted!"
			redirect_to artists_path
		else
			flash[:danger] = "You are not authorized to delete artist!"
		end
	end

	private

	def artist_params
		params.require(:artist).permit(:name, :user_id, :artist_info)
	end

	def find_artist
		@artist = Artist.find(params[:id])
	end

end