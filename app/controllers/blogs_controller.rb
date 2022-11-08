class BlogsController < ApplicationController
	include ActionView::Helpers::DateHelper
	before_action :authenticate_user!
	helper_method :time_in_words

	def index
	    if params["blogs"] == 'all_blogs'
	      	@blogs = Blog.includes(:website).notice_visible
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
		params.require(:blog).permit(:content, :website_id, :status)
	end

	def time_in_words(blog)
	 	created_time = blog.created_at
	 	time_ago_in_words(created_time)
	end
end