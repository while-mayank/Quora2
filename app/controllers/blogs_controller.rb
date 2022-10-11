class BlogsController < ApplicationController
	before_action :authenticate_user!
	def index
	    if params["blogs"] == 'all_blogs'
	      	@blogs = Blog.includes(:website).all
	    else
      		@blogs = current_user.blogs.includes(:website)
	    end
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = current_user.blogs.create(blog_params)
		
		if @blog.save

			redirect_to blogs_path
		else
			redirect_to new_blog_path
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end 

	def blog_user
		@blogs = current_user.blogs
	end 	

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		
		if @blog.update(blog_params)
			redirect_to :blog_user
		else 
			redirect_to :create
		end
	end	

	private

	def blog_params
		params.require(:blog).permit(:content, :website_id)
	end
end