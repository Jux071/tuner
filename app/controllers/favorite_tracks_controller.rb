class FavoriteTracksController < ApplicationController
  before_action :authorize
  before_action :set_track, except: [:index]

  def index
    @favorites = current_user.favorite_tracks.count
    @tracks = current_user.favorite_tracks
    @fav = Track.joins(:favorites)
  end

  def create
    if Favorite.create(track: @track, user: current_user)
      redirect_to tracks_path, notice: "#{@track.name} added to favorites"
    else
      redirect_to tracks_path, alert: "Something went wrong!!!"
    end
  end
  
  def destroy
    Favorite.where(track_id: @track.id, user_id: current_user.id).first.destroy
    redirect_to tracks_path, alert: "#{@track.name} removed from favorites"
  end
  
  private
  
  def set_track
    @track = Track.find(params[:track_id] || params[:id])
  end
end