class Superadmin::AlbumsController < Superadmin::BaseController
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }
	
	def index
		@albums = Album.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params)
		@genre = Genre.new

		respond_to do |format|
    format.html
    format.json  { render :json => @genre }
  end

		if @album.save
			flash[:success] = 'Album created successfully'
			redirect_to [:superadmin, @album]
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @album.update(album_params)
			redirect_to [:superadmin, @album]
		else
			render :edit
		end
	end

	def show
		@tracks = @album.tracks
	end

	def destroy
		@album.destroy
		flash[:danger] = 'Album deleted'
		redirect_to superadmin_albums_path
	end

	private

	def album_params
     params.require(:album).permit(:title, :released, :description, :artist_id, :genre_id, :cover, :user_id)
   end

	def find_album
		@album = Album.find(params[:id])
	end

end