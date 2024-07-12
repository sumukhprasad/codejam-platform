class ServerTimeSyncHandler
	@queue = :server_time_sync_queue

	def self.perform
		puts "Boradcasting server time..."
		ActionCable.server.broadcast("server_time_channel", DateTime.now.utc.iso8601)
		puts "Done."
	end
end