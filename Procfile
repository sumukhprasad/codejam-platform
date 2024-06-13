# Procfile

redis: redis-server
web: rails s -p 3000
resque: QUEUE=* bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler