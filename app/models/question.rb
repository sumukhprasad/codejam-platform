class Question < ApplicationRecord
	include RansackSearchable
	
	has_many :testcases
	has_many :submissions
	
	validates :score, presence: true
	validates :number, presence: true
	validates :slug, presence: true
	
	has_one_attached :content
	has_one_attached :banner_image
end
