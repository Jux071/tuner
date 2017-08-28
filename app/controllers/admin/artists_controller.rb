class Admin::ArtistsController < Admin::BaseController
	before_action :authorize_for_admins
	before_action :find_artist, { only: [:edit, :update, :show, :destroy]}

	def index
		@artist = Artist.all
	end

	def new
		@artist = Artist.new		
	end

	def create
		@artist = Artist.new(artist_params)

		if @artist.save
			flash[:success] = 'Artist created successfully'
			redirect_to [:admin, @artist]
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @artist.update(artist_params)
			redirect_to [:admin, @artist]
		else
			render :edit
		end
	end

	def show
		@tracks = @artist.tracks.limit(10)
	end

	def destroy
		if @artist.user_id == current_user
			@artist.destroy
			flash[:success] = "Artist deleted!"
			redirect_to admin_artists_path
		else
			flash[:notice] = "You are not authorized to delete artist!"
		end
	end

	private

	def artist_params
		params.require(:artist).permit(:name, :user_id, :artist_info)
	end

	def find_artist
		@artist = Artist.find(params[:id])
	end

end