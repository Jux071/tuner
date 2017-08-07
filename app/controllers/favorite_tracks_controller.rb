class FavoriteTracksController < ApplicationController
  before_action :set_track

  def create
    if Favorite.create(track: @track, user: current_user)
      redirect_to tracks_path, notice: 'Added to favorites'
    else
      redirect_to tracks_path, alert: 'Something went wrong!!!'
    end
  end
  
  def destroy
    Favorite.where(track_id: @track.id, user_id: current_user.id).first.destroy
    redirect_to tracks_path, notice: 'Removed from favorites'
  end
  
  private
  
  def set_track
    @track = Track.find(params[:track_id] || params[:id])
  end
end