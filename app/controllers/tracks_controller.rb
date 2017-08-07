class TracksController < ApplicationController

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
			flash[:notice] = 'Track created successfully'
			redirect_to tracks_path
		else
			flash[:notice] = 'Error'
			render :new
		end
	end

	def edit
		
	end

	def update
		if @track.update(track_params)
			redirect_to @track
		else
			render :edit
		end
	end

	def show
		
	end

	def destroy
		@track.destroy
		flash[:notice] = 'Track deleted'
		redirect_to tracks_path
	end



	private

	def track_params
		params.require(:track).permit(:name, :duration, :artist_id, :genre_id, :album_id, :user_id)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @track
      redirect_to :back, notice: 'You favorited #{@track.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@track)
      redirect_to :back, notice: '#{@track.name} removed from favorites'

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
end
end