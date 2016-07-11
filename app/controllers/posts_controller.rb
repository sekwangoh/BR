class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end	
	end

	def edit
		@post = Post.find(params[:id])
	end	

	def update
		@post = Post.find(parmas[:id])

		if @post.update(article_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destory
		@post = Post.find(params[:id])
		@post.destory

		redirect_to post_path
	end	 
			
	

	def show
		@post = Post.find(params[:id])
	end	

	def index
		@posts = Post.all
	end	
		
	def post_params
		params.require(:post).permit(:title, :text)	
	end
		
end
