class PlaylistTracksController < ApplicationController
  before_action :authorize

  # def index
  #   @playlist_tracks = PlaylistTrack.all
  #   @tracks = Track.all

  #   respond_to do |format|
  #     format.html
  #     #format.js
  #     format.json { render json: @playlist_tracks}
  #   end
  # end

  # def show
  #   @playlist_tracks = PlaylistTrack.find(params[:id])

  #   respond_to do |format|
  #     format.html
  #     #format.js
  #     format.json { render json: @playlist_tracks }
  #   end
  # end

  # def new
  #   @playlist_track = PlaylistTrack.new

  #   respond_to do |format|
  #     format.html
  #     #format.js
  #     format.json { render json: @playlist_track }
  #   end
  # end

  # def edit
  #   @playlist_track = PlaylistTrack.find(params[:id])

  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  # def create
  #   #@track = Track.find(params[:id])
  #   @playlist_track = PlaylistTrack.new(playlist_track_params)
  #   #@track = Track.find(params[:track_id] || params[:id])
  #   #@playlist_track.track_id = params[:track_id]
  #   #@track = Track.find(params[:id])

  #   respond_to do |format|
  #     if @playlist_track.save
  #       format.html { redirect_to @playlist_track, notice: 'Successfully created' }
  #       #format.js
  #       format.json { render json: @playlist_track, status: :created, location: @playlist_track }
  #     else
  #       format.html { render action: "new" }
  #       #format.js
  #       format.json { render json: @playlist_track.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   @playlist_track = PlaylistTrack.find(params[:id])

  #   respond_to do |format|
  #     if @playlist_track.update_attributes(playlist_track_params)
  #       format.html { redirect_to @playlist_track, notice: 'Updated' }
  #       #format.js
  #       format.json { head :no_content }
#      else
 #       format.html { render action: "edit" }
        #format.js
#        format.json { render json: @playlist_track.errors, status: :unprocessable_entity }
#      end
#    end
#  end

 # def destroy
 #   @playlist_track = PlaylistTrack.find(params[:id])
 #   @playlist_track.destroy

#    respond_to do |format|
#      format.html { redirect_to playlist_tracks_url }
      #format.js
#      format.json { head :no_content }
#    end
#  end

#  private

#  def playlist_track_params
#    params.require(:playlist_track).permit(:playlist_id, :track_id)
#  end



def create
    @track = Track.find(params[:trackId])
    @playlist = Playlist.find(params[:playlist_track][:playlist_id] || params[:id])
    unless PlaylistTrack.find_by(track_id: @track.id, playlist_id: @playlist.id)
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: "#{@track.name} added to playlist!"
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
    redirect_to playlist_path(@playlist), notice: "#{@track.name} removed from playlist"
  end
  
end



