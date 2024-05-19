class Question < ApplicationRecord
	include RansackSearchable
	
	has_many :testcases
	
	has_one_attached :content
	has_one_attached :banner_image
end
