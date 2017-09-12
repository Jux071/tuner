class Superadmin::TracksController < Superadmin::BaseController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	
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

	private

	def track_params
		params.require(:track).permit(:name, :duration, :artist_id, :genre_id, :album_id, :user_id, :link)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

end