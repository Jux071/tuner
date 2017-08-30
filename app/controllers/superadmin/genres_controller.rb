class Superadmin::GenresController < Superadmin::BaseController
	before_action :authorize_for_superadmins
	before_action :find_genre, { only: [:edit, :update, :show, :destroy]}


	def index
		@genre = Genre.all
		@albums = Album.all
	end

	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)

		#respond_to do |format|
		if @genre.save
			flash[:success] = 'Genre created successfully'
			#format.html { redirect_to @genre, notice: 'Product was successfully created.' }
      #format.json { render json: @genre, status: :created, location: @genre }
      #format.js
			redirect_to [:superadmin, @genre]
		else
			flash[:notice] = 'Error'
			render :new
			#format.html { render action: "new" }
      #format.json { render json: @genre.errors, status: :unprocessable_entity }
      #format.js
		end
	end

	def edit
		
	end

	def update
		if @genre.update(genre_params)
			redirect_to [:superadmin, @genre]
		else
			render :edit
		end
	end

	def show
		@tracks = @genre.tracks
	end

	def destroy
		if @genre.user_id = current_user.user_id
			@genre.destroy
			flash[:success] = "Genre deleted!"
			redirect_to superadmin_genres_path
		else
			flash[:danger] = "You are not authorized to delete genre!"
		end
	end

	private

	def genre_params
		params.require(:genre).permit(:name, :user_id, :description)
	end

	def find_genre
		@genre = Genre.find(params[:id])
	end

end
