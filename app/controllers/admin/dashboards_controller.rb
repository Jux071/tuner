class Admin::DashboardsController < Admin::BaseController
	def show
		@tracks = Track.count
		@albums = Album.count
		@genres = Genre.count
		@users = User.count
		@artists = Artist.count

	end
end