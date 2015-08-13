class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:posts_page], per_page: 1) 
		@favorites = @user.favorites.paginate(page: params[:favorites_page], per_page: 1)
		@followers = @user.followers
		@followings = @user.following
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User Created!"
			redirect_to login_path
		else
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name,:username,:email,:password)
		end

end