# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

require File.expand_path(File.dirname(__FILE__) + '/environment')

set :job_template, "/bin/zsh -l -c ':job'"
job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"
set :timezone, 'Asia/Tokyo'

every 1.day, at: '9:00 am' do
  rake 'reward:send_reward'
end
