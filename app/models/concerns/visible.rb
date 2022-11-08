module Visible
	extend ActiveSupport::Concern

included do 
	scope :notice_visible, -> {where(status: true )}
end

class_methods do 

	def is_visible
		@blogs = Blog.includes(:website).notice_visible
	end
end















end