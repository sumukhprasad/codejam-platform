module ApplicationHelper
	def is_active(path, str)
		request.path == path ? str : '' 
	end
end
