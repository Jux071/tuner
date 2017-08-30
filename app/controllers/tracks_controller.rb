class TracksController < ApplicationController
  before_action :authorize_for_users
	before_action :find_track, { only: [:show] }
	
	#def index
#if params[:search]
#@tracks = Track.search(params[:search])
#else
#@tracks = Track.all
#end
#end

def index
	@tracks = Track.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	@popular = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC').limit(5)
end

def show

end

private

def find_track
	@track = Track.find(params[:id])
end

end