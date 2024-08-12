class Question < ApplicationRecord
	include RansackSearchable
	
	has_many :testcases, dependent: :destroy
	has_many :submissions, dependent: :destroy
	
	validates :score, presence: true
	validates :number, presence: true
	validates :slug, presence: true
	
	has_one_attached :content
	has_one_attached :banner_image
end
