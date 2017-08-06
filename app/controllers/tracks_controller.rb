class TracksController < ApplicationController

	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	def index
		@tracks = Track.all
		if params[:search]
			@tracks = Track.search(params[:search]).order("created_at DESC")
		else
			@tracks = Track.all.order('created_at DESC')
		end
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

end