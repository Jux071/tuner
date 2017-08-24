class Superadmin::DashboardsController < Superadmin::BaseController
	
	def index
		@albums = Album.all
		@tracks = Track.all.order('created_at ASC')
	end

	def show
		@tracks = Track.all.order('created_at ASC').paginate(:page => 1, :per_page => 10)
	end

end