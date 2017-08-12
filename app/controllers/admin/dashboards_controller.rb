class Admin::DashboardsController < Admin::BaseController
	
	def index
		@albums = Album.all
		@tracks = Track.all.order('created_at ASC')
	end

	def show
		@tracks = Track.all.order('created_at ASC')
	end

end