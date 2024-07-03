ActiveAdmin.register Testcase do
	permit_params :title, :input, :output, :question_id, :testcase_number
	remove_filter :input_attachment, :input_blob, :output_attachment, :output_blob
	
	form do |f|
		f.inputs do
			f.input :title
			f.input :input, as: :file
			f.input :output, as: :file
			f.input :testcase_number
			f.input :question_id, :as => :select, :collection => Question.all.map { |u| ["#{u.title.to_s}", u.id] }
		end
		f.actions
	end
	
	show do
		attributes_table do
			row :title
			row :testcase_number
			row :input do |f|
				link_to f.input.filename, rails_blob_path(f.input, disposition: 'attachment') if f.input.attached?
			end
			row :output do |f|
				link_to f.output.filename, rails_blob_path(f.output, disposition: 'attachment') if f.output.attached?
			end
		end
	end
end
