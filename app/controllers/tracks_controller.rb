class TracksController < ApplicationController
  before_action :authorize_for_users
	before_action :find_track, { only: [:show] }
	
	def index
		@tracks = Track.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end

	def show

	end

	private

	def find_track
		@track = Track.find(params[:id])
	end

end