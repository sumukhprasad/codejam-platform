ActiveAdmin.register ContestConfiguration do
	permit_params :start_time, :end_time, :before_start_notice, :after_end_notice, :active
end
