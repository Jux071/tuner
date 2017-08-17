class TrackPlaylistsController < ApplicationController
  before_action :set_track, except: [:index]

  def index
    @favorites = playlist.playlist_tracks_tracks.count
    @tracks = playlist.playlist_tracks
    
  end

  def create
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: "#{@track.name} added to playlist"
    else
      redirect_to tracks_path, alert: "Something went wrong!!!"
    end
  end
  
  def destroy
    PlaylistTrack.where(track_id: @track.id, playlist_id: playlist.id).first.destroy
    redirect_to tracks_path, alert: "#{@track.name} removed from favorites"
  end
  
  private
  
  def set_track
    #@track = Track.find(params[:track_id] || params[:id])
    #@playlist = Playlist.find(params[:playlist_id] || params[:id])
  end
end