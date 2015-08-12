class PostsController < ApplicationController
	def index
		@posts = Post.all
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

	private
		def post_params
			params.require(:post).permit(:title,:summary,:body)
		end

end