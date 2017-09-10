class PlaylistTracksController < ApplicationController
  before_action :authorize_for_users

  def create
    @track = Track.find(params[:trackId])
    @playlist = Playlist.find(params[:playlist_track][:playlist_id] || params[:id])
    unless PlaylistTrack.find_by(track_id: @track.id, playlist_id: @playlist.id)
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path
      flash[:success] = "#{@track.name} added to playlist!"
    else
      redirect_to tracks_path, alert: 'Error!!!'
    end
    else
      redirect_to tracks_path, notice: 'You can add track only once to playlist'
    end
  end
  
  def destroy
    @track = Track.find(params[:track_id])
    @playlist = Playlist.find(params[:playlist_id])
    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
    redirect_to playlist_path(@playlist)
    flash[:danger] = "#{@track.name} removed from playlist"
  end
  
end



