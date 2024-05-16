# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
	include Accessible
	skip_before_action :check_user, except: [:new, :create]
	before_action :configure_sign_up_params, only: [:create]
	before_action :configure_account_update_params, only: [:update]

	# GET /resource/sign_up
	# def new
	#   super
	# end

	#POST /resource
	def create
		begin
			params[:student][:institution_id] = params[:student][:institution_id].gsub('-', '')
			params[:student][:institution_id] = Institution.find_by(:institution_code => params[:student][:institution_id]).id
		rescue
			flash[:error] =  "Institution does not exist."
		end
		
		super
	end

	# GET /resource/edit
	# def edit
	#   super
	# end

	# PUT /resource
	def update
		begin
			params[:student][:institution_id] = params[:student][:institution_id].gsub('-', '')
			params[:student][:institution_id] = Institution.find_by(:institution_code => params[:student][:institution_id]).id
		rescue
			flash[:error] =  "Institution does not exist."
		end
		
		super
	end

	# DELETE /resource
	# def destroy
	#   super
	# end

	# GET /resource/cancel
	# Forces the session data which is usually expired after sign
	# in to be expired now. This is useful if the user wants to
	# cancel oauth signing in/up in the middle of the process,
	# removing all OAuth session data.
	# def cancel
	#   super
	# end

	# protected

	# If you have extra params to permit, append them to the sanitizer.
	def configure_sign_up_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :preferred_first_name, :middle_name, :last_name, :gender, :institution_id, :institution, :date_of_birth])
	end

	# If you have extra params to permit, append them to the sanitizer.
	def configure_account_update_params
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :preferred_first_name, :middle_name, :last_name, :gender, :institution_id, :institution, :date_of_birth])
	end

	# The path used after sign up.
	# def after_sign_up_path_for(resource)
	#   super(resource)
	# end

	# The path used after sign up for inactive accounts.
	# def after_inactive_sign_up_path_for(resource)
	#   super(resource)
	# end
end
