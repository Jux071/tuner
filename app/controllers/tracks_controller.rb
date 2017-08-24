class TracksController < ApplicationController
  before_action :authorize
	before_action :find_track, { only: [:show] }
	
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

def show

end

private

def find_track
	@track = Track.find(params[:id])
end

end