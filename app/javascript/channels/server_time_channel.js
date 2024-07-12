import consumer from "channels/consumer"

consumer.subscriptions.create("ServerTimeChannel", {
	connected() {
		console.log("Connected to time updates.");
	},

	disconnected() {
		// Called when the subscription has been terminated by the server
	},

	received(data) {
		if (window["clocks"]) { updateClockWithServerTime(data); }
	}
});
