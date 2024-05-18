class Testcase < ApplicationRecord
	include RansackSearchable
	
	has_one_attached :input
	has_one_attached :output
end
