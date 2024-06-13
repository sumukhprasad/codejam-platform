class CreateContestConfigurations < ActiveRecord::Migration[7.1]
	def change
		create_table :contest_configurations do |t|
			t.datetime :start_time
			t.datetime :end_time
			t.text :before_start_notice
			t.text :after_end_notice

			t.timestamps
		end
	end
end
