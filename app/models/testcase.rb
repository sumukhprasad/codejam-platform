class Testcase < ApplicationRecord
	include RansackSearchable
	
	belongs_to :question
	
	has_one_attached :input
	has_one_attached :output
end
