class PlaylistsController < ApplicationController
	before_action :find_playlist, { only: [:edit, :update, :show, :destroy]}


	def index
		@playlist = current_user.playlists
		@albums = Album.all
	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.new(playlist_params)
		#@playlist.user_id = current_user.user_id

		if @playlist.save
			flash[:success] = "Playlist created successfully!"
			redirect_to playlists_path
		else
			render :new
		end		
	end

	def edit
		
	end

	def update
		if @playlist.update(playlist_params)
			redirect_to playlist_path
		else
			render :edit
		end
	end

	def show
		#@tracks = @playlist.tracks
	end

	def destroy
		@playlist.destroy
		flash[:success] = "Playlist deleted"
		redirect_to playlists_path
	end

	private

	def playlist_params
		params.require(:playlist).permit(:name, :user_id)		
	end

	def find_playlist
		@playlist = Playlist.find(params[:id])	
	end
end