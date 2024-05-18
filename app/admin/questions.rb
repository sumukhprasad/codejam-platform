ActiveAdmin.register Question do
	permit_params :title, :content, :banner_image
	remove_filter :banner_image_attachment, :banner_image_blob, :content_attachment, :content_blob
	
	
	form do |f|
		f.inputs do
			f.input :title
			f.input :content, as: :file
			f.input :banner_image, as: :file
		end
		f.actions
	end
	
	show do
		attributes_table do
			row :title
			row :content do |f|
				link_to f.content.filename, rails_blob_path(f.content, disposition: 'attachment') if f.content.attached?
			end
			row :banner_image do |f|
				link_to f.banner_image.filename, rails_blob_path(f.banner_image, disposition: 'attachment') if f.banner_image.attached?
			end
		end
	end
end
