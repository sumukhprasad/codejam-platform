ActiveAdmin.register Testcase do
	permit_params :title, :input, :output
	remove_filter :input_attachment, :input_blob, :output_attachment, :output_blob
	
	form do |f|
		f.inputs do
			f.input :title
			f.input :input, as: :file
			f.input :output, as: :file
		end
		f.actions
	end
	
	show do
		attributes_table do
			row :title
			row :input do |f|
				link_to f.input.filename, rails_blob_path(f.input, disposition: 'attachment') if f.input.attached?
			end
			row :output do |f|
				link_to f.input.filename, rails_blob_path(f.input, disposition: 'attachment') if f.input.attached?
			end
		end
	end
end
