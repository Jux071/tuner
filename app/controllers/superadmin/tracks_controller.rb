class Superadmin::TracksController < Superadmin::BaseController
  before_action :authorize_for_superadmins
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	
	#def index
#if params[:search]
#@tracks = Track.search(params[:search])
#else
#@tracks = Track.all
#end
#end

def index
	@tracks = Track.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	@popular = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC').limit(5)
end


	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)

		if @track.save
			flash[:success] = 'Track created successfully'
			redirect_to [:superadmin, @track]
		else
			flash[:notice] = 'Error'
			render :new
		end
	end

	def edit
		
	end

	def update
		if @track.update(track_params)
			redirect_to [:superadmin, @track]
		else
			render :edit
		end
	end

	def show

	end

	def destroy
		@track.destroy
		flash[:notice] = 'Track deleted'
		redirect_to superadmin_tracks_path
	end

	def newest
		@tracks = Track.newest
	end

	def add_to_playlist
  @track = Track.find(params[:id])
  @playlist = current_user.playlists.where(id: params[:playlist_id]).first
  if @playlist.blank?
    respond_to do |format|
    format.html { redirect_to playlists_path, notice:'Create your first playlist to add videos' }
    end 
  else
    @track.playlists << @playlist
    @playlist.save 
    respond_to do |format|
      format.html { redirect_to tracks_path, notice: 'Video was successfully added to the playlist.' }
    end
  end
end   


	private

	def track_params
		params.require(:track).permit(:name, :duration, :artist_id, :genre_id, :album_id, :user_id, :link)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

end