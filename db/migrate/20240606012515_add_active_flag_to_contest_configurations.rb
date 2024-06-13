class AddActiveFlagToContestConfigurations < ActiveRecord::Migration[7.1]
	def change
		add_column :contest_configurations, :active, :boolean
	end
end
