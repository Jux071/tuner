class Admin::TracksController < Admin::BaseController
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
			respond_to do |format|
				flash[:success] = 'Track added successfully'
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
		flash[:danger] = 'Track deleted'
		redirect_to admin_tracks_path
	end

	private

	def track_params
		params.require(:track).permit(:name, :duration, :artist_id, :genre_id, :album_id, :user_id, :link)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

end