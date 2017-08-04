class TracksController < ApplicationController

	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	def index
		@tracks = Track.all
	end

	def new
		@track = Track.new
	end

	def create
		@track = Track.new(track_params)
		if @track.save
			flash[:notice] = 'Album created successfully'
			redirect_to tracks_path
		else
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
		params.require(:track).permit(:name, :duration)		
	end

	def find_track
		@track = Track.find(params[:id])
	end

end