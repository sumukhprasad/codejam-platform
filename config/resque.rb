require 'resque' # include resque so we can configure it
require 'resque/server'
require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.schedule = YAML.load_file('config/scheduled_tasks.yml')