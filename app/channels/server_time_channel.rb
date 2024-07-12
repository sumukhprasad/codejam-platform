class ServerTimeChannel < ApplicationCable::Channel
	def subscribed
		stream_from "server_time_channel"
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end
