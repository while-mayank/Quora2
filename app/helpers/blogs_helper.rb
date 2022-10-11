module BlogsHelper

	def time_in_words(blog)
	 	created_time = blog.created_at
	 	time_ago_in_words(created_time)
	end
	
end

