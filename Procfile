# Procfile

redis: redis-server
web: bundle exec rails s
resque: QUEUE=* bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler