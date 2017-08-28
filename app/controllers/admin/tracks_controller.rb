class Admin::TracksController < Admin::BaseController
  before_action :authorize_for_admins
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
	@popular = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC').limit(5)
end


	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)

		if @track.save
			respond_to do |format|
        format.html { redirect_to [:admin, @track] }
        format.js
      end
		#	flash[:success] = 'Track created successfully'
		#	redirect_to [:admin, @track]
		else
			respond_to do |format|
        format.html { render :edit }
        format.js
      end
      #flash[:notice] = 'Error'
			#render :new
		end
	end

	def edit
		@track = Track.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
	end

	def update
		if @track.update(track_params)
			respond_to do |format|
        format.html { redirect_to [:admin, @track] }
        format.js
      end
    else			
			respond_to do |format|
        format.html { render :edit }
        format.js
      end
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