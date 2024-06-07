class ContestConfiguration < ApplicationRecord
	include RansackSearchable
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :before_start_notice, presence: true
	validates :after_end_notice, presence: true
	validates :active, inclusion: { in: [ true, false ] }
end
