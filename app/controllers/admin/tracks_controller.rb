class Admin::TracksController < Admin::BaseController
  before_action :authorize
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	
	#def index
#if params[:search]
#@tracks = Track.search(params[:search])
#else
#@tracks = Track.all
#end
#end

def index
	@tracks = Track.search(params[:search])
end


	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)

		if @track.save
			flash[:success] = 'Track created successfully'
			redirect_to [:admin, @track]
		else
			flash[:notice] = 'Error'
			render :new
		end
	end

	def edit
		
	end

	def update
		if @track.update(track_params)
			redirect_to [:admin, @track]
		else
			render :edit
		end
	end

	def show

	end

	def destroy
		@track.destroy
		flash[:notice] = 'Track deleted'
		redirect_to admin_tracks_path
	end

	def newest
		@tracks = Track.newest
	end



	private

	def track_params
		params.require(:track).permit(:name, :duration, :artist_id, :genre_id, :album_id, :user_id, :link)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

end