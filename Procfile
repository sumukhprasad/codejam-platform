# Procfile

redis: redis-server
web: rails s -p 3000 --binding=0.0.0.0
resque-leaderboard: QUEUE=leaderboard_generation_queue bundle exec rake resque:work
resque-timesync: QUEUE=server_time_sync_queue bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler