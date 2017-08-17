class PlaylistTracksController < ApplicationController
	#before_action :set_track_and_playlist
 #def index
  #  @favorites = playlist.playlist_tracks_tracks.count
  #  @tracks = playlist.playlist_tracks
    
  #end
  #def new
  #  @playlist_tracks = PlaylistTrack.new
 # end

	# def index
	# 	#@orders = Order.where(user: current_user) ova metoda se rjedje koristi
	# 	#@playlist_tracks = @playlist.tracks
	# 	@playlist_tracks = Playlist.joins(:tracks)

 #    @favorites = current_user.favorite_tracks.count
 #    @tracks = current_user.favorite_tracks
 #    #@playlist = current_user.playlists.find(params[:playlist_id])

	# end

 #  def create
 #    if PlaylistTrack.create(track: @track, playlist: @playlist)
 #      redirect_to tracks_path, notice: 'Track has been added'
 #    else
 #      redirect_to tracks_path, alert: 'Error!'
 #    end
 #  end
  
 #  def destroy
 #    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
 #    redirect_to tracks_path, notice: 'Removed from playlist'
 #  end
  
 #  private
  
 #  def set_track_and_playlist
 #    @track = Track.find(params[:track_id] || params[:id])
 #    @playlist = Playlist.find(params[:playlist_id] || params[:id])
 #  end

  #def index
   # @playlist_tracks = PlaylistTrack.all  
  #end

  #def create
  #  @playlist_track = playlist.playlist_tracks.build
   ## @playlist_track.playlist_id = params[:playlist_id]
   # @playlist_track.save
    #@order = current_user.orders.build 
   # @order.product_id = params[:product_id]
   # @order.save

  # if PlaylistTrack.create(track: @track, playlist: @playlist)
   #    redirect_to tracks_path, notice: 'Track has been added'
   #  else
    #   redirect_to tracks_path, alert: 'Error!'
   #  end

  #  respond_to do |format|
   #   format.js
   #   format.html
   # end
    
  #end

  def index
    @playlist_tracks = PlaylistTrack.all
    @tracks = Track.all

    respond_to do |format|
      format.html
      format.json { render json: @playlist_tracks}
    end
  end

  def show
    @playlist_tracks = PlaylistTrack.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @playlist_tracks }
    end
  end

  def new
    @playlist_track = PlaylistTrack.new

    respond_to do |format|
      format.html
      format.json { render json: @playlist_track }
    end
  end

  def edit
    @playlist_track = PlaylistTrack.find(params[:id])
  end

  def create
    #@track = Track.find(params[:id])
    @playlist_track = PlaylistTrack.new(playlist_track_params)
    #@track = Track.find(params[:track_id] || params[:id])
    #@playlist_track.track_id = params[:track_id]
    #@track = Track.find(params[:id])

    respond_to do |format|
      if @playlist_track.save
        format.html { redirect_to @playlist_track, notice: 'Successfully created' }
        format.json { render json: @playlist_track, status: :created, location: @playlist_track }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist_track.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @playlist_track = PlaylistTrack.find(params[:id])

    respond_to do |format|
      if @playlist_track.update_attributes(playlist_track_params)
        format.html { redirect_to @playlist_track, notice: 'Updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist_track.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist_track = PlaylistTrack.find(params[:id])
    @playlist_track.destroy

    respond_to do |format|
      format.html { redirect_to playlist_tracks_url }
      format.json { head :no_content }
    end
  end

  private

  def playlist_track_params
    params.require(:playlist_track).permit(:playlist_id, :track_id)
  end

end
