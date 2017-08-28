class Superadmin::DashboardsController < Superadmin::BaseController
	
	def index
		@albums = Album.all
		@tracks = Track.all.order('created_at ASC')
		@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC')
.limit(5)
	end

	def show
		@tracks = Track.all.order('created_at ASC').paginate(:page => 1, :per_page => 10)
		@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC')
.limit(5)
	end

end