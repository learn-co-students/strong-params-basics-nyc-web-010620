class PostsController < ApplicationController

	# index, show, new & create, edit & update
	def index
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(strong(:title, :description))
		@post.save
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		@post.update(strong(:title))
		redirect_to post_path(@post)
	end

	private
	def strong(*args)
			params.require(:post).permit(*args)
	end

end



