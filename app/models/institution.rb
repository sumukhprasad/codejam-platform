class Institution < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	validates :name, presence: true
	validates :website, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
	validates :phone_country_code, presence: true, numericality: { only_integer: true }
	validates :phone_number, presence: true, numericality: { only_integer: true }
	validates :address_line_one, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true
	validates :zip_code, presence: true, numericality: { only_integer: true }
	validates :secondary_contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :institution_code, presence: true, uniqueness: true, length: { is: 12 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
	validate :different_emails
	
	before_validation(on: :create) do
		generate_institution_code
	end
	
	before_save do
		self.email = email.downcase
	end
	
	has_many :students
	
	private 
	
	def generate_institution_code
		loop do
			self.institution_code = SecureRandom.hex(6)
			break unless Institution.exists?(institution_code: institution_code)
		end
	end
	
	def different_emails
		if email == secondary_contact_email
			errors.add(:secondary_contact_email, "can't be the same as primary email")
		end
	end
	
	
end
