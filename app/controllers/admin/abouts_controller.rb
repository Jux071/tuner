class Admin::AboutsController < Admin::BaseController
	def show
		@about = 'Welcome to Tuner, place where you can find fantastic music and create awesome playlists. Here you can find various type of music, rock, pop, metal, and many many more. Even though we exist only few months, our customers are satisfied. If you have any concerns feel free to contact us.'		
	end
end