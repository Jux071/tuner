class Admin::AlbumsController < Admin::BaseController
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }
	
	def index
		@albums = Album.search(params[:search])
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params)
		@genre = Genre.new

		respond_to do |format|
    format.html  
    format.json  { render :json => @album }
  end

		if @album.save
			flash[:notice] = 'Album created successfully'
			redirect_to [:admin, @album]
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @album.update(album_params)
			redirect_to [:admin, @album]
		else
			render :edit
		end
	end

	def show
		@tracks = @album.tracks
	end

	def destroy
		@album.destroy
		flash[:success] = 'Album deleted'
		redirect_to admin_albums_path
	end

	private

	def album_params
     params.require(:album).permit(:title, :released, :description, :artist_id, :genre_id, :cover, :user_id)
   end

	def find_album
		@album = Album.find(params[:id])
	end

end