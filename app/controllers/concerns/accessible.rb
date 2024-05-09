module Accessible
	extend ActiveSupport::Concern
	included do
		before_action :check_user
	end

	protected
	def check_user
		if current_admin_user
			flash.clear
			redirect_to(admin_root_path) and return
		elsif current_student
			flash.clear
			redirect_to(root_path) and return
	
	elsif current_institution
	flash.clear
	redirect_to(root_path) and return
		end
	end
end