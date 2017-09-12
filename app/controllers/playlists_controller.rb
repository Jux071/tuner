class PlaylistsController < ApplicationController
	before_action :authorize_for_users
	before_action :find_playlist, { only: [:edit, :update, :show, :destroy]}

	def index
		@playlists = Playlist.where(user_id: current_user.id)
		@albums = Album.all
	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.new(playlist_params)		

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
		@tracks = @playlist.tracks
		@playlist_tracks = PlaylistTrack.all
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