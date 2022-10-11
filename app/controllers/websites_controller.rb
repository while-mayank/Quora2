class WebsitesController < ApplicationController
	before_action :authenticate_user!
	def index
		@websites = current_user.websites
	end

	def new
		@website = Website.new
	end

	def create
		@user = current_user
		@website = @user.websites.create(website_params)
		if @website.save
			redirect_to controller: :homes, action: :index
		else 
			redirect_to :create
		end 
	end

	private

	def website_params
		params.require(:website).permit(:url, :user_id)
	end

end
