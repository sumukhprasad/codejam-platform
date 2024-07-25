ActiveAdmin.register Question do
	permit_params :title, :content, :banner_image, :score, :number, :slug
	remove_filter :banner_image_attachment, :banner_image_blob, :content_attachment, :content_blob
	
	form do |f|
		f.inputs do
			f.input :number
			f.input :title
			f.input :slug
			f.input :score
			f.input :content, as: :file
			f.input :banner_image, as: :file
		end
		f.actions
	end
	
	show do
		tabs do
			tab :about do
				attributes_table do
					row :number
					row :title
					row :slug
					row :score
					row :content do |f|
						link_to f.content.filename, rails_blob_path(f.content, disposition: 'attachment') if f.content.attached?
					end
					row :banner_image do |f|
						link_to f.banner_image.filename, rails_blob_path(f.banner_image, disposition: 'attachment') if f.banner_image.attached?
					end
					row :testcases do |f|
						for testcase in f.testcases do
							testcase.testcase_number
						end
					end
				end
			end
			
			tab :preview do
				render partial: 'question_content', locals: { title: question.title, content:  question.content.download, image: question.banner_image }	
			end
		end
	end
end
