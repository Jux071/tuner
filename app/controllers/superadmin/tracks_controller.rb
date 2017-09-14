class Superadmin::TracksController < Superadmin::BaseController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	
	def index
		@tracks = Track.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)

		unless @track.album.nil? 
    	@track.genre_id = @track.album.genre_id
    	@track.artist_id = @track.album.artist_id
    end

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
		flash[:danger] = 'Track deleted'
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