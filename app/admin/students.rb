ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :preferred_first_name, :middle_name, :last_name, :gender, :date_of_birth, :institution_id, :testcase_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :preferred_first_name, :middle_name, :last_name, :gender, :date_of_birth, :institution_id, :testcase_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :email, :first_name, :preferred_first_name, :middle_name, :last_name, :gender, :date_of_birth, :institution_id
  
end
