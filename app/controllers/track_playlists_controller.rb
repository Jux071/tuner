class TrackPlaylistsController < ApplicationController
	#before_action :set_track_and_playlist

	def index
		#@orders = Order.where(user: current_user) ova metoda se rjedje koristi
		#@playlist_tracks = @playlist.tracks
		@playlist_tracks = Playlist.joins(:tracks)

    @favorites = current_user.favorite_tracks.count
    @tracks = current_user.favorite_tracks

	end

  def create
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: 'Track has been added'
    else
      redirect_to tracks_path, alert: 'Error!'
    end
  end
  
  def destroy
    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
    redirect_to tracks_path, notice: 'Removed from playlist'
  end
  
  private
  
  def set_track_and_playlist
    @track = Track.find(params[:track_id] || params[:id])
    @playlist = Playlist.find(params[:playlist_id] || params[:id])
  end

end