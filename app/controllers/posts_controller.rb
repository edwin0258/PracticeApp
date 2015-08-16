class PostsController < ApplicationController
	before_action :user?, only: [:new, :favorite, :comment, :create]

	def newest_index
		@posts = Post.paginate(:page => params[:page], :per_page => 2).order("created_at DESC")
	end
	def popular_index
		@posts = Kaminari.paginate_array(Post.all.sort_by{|post| post.favorites.size}.reverse).page(params[:page]).per(2)
		if params[:search]
			@posts = Post.where(' title LIKE ? ', "%#{params[:search]}%").page(params[:page])
		end
	end
	def show
		@post = Post.find(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user = User.find(current_user)
		if @post.save
			flash[:success] = "Post Created!"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end


	def favorite
		@user = User.find(current_user)
		@post = Post.find(params[:id])
		favorite = Favorite.create(favorite: params[:favorite], user: @user, post: @post)
		if favorite.valid?
			flash[:success] = "Post Favorited"
		else
			flash[:danger] = "Post Unfavorited"
			favorite = @user.favorites.find_by(post_id: @post).destroy
		end
		redirect_to :back
	end

	def comment
		@user = User.find(current_user)
		@post = Post.find(params[:id])
		comment = Comment.create(title: params[:title], body: params[:body], user: @user, post: @post)
		if comment.valid?
			flash[:success] = "Comment Posted"
		else
			flash[:danger] = "Comment Invalid"
		end
		redirect_to :back
	end

	private
		def post_params
			params.require(:post).permit(:title,:summary,:body,:image, :remote_image_url)
		end

		def user?
			unless current_user
				flash[:danger] = "You must be logged in"
				redirect_to root_path
			end
		end

end