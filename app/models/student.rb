class Student < ApplicationRecord
	include RansackSearchable
	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
				
	belongs_to :institution
	has_many :submissions, dependent: :destroy
	
	validates :first_name, :last_name, presence: true
	# validates :preferred_first_name
	# validates :middle_name
	validates :gender, presence: true
	validates :date_of_birth, presence: true
	validates :testcase_number, presence: true
	validate :date_of_birth_minimum_age
	before_validation(on: :create) do
		generate_testcase_number
	end
	
	private
	
	def generate_testcase_number
		self.testcase_number = rand(1..20)
	end

	def date_of_birth_minimum_age
		if date_of_birth.present? && date_of_birth > 14.years.ago.to_date
			errors.add(:date_of_birth, "must be at least 14 years ago.")
		end
	end
end
