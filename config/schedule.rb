# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

require File.expand_path(File.dirname(__FILE__) + '/environment')

env :PATH, ENV['RBENV_ROOT'] ? "#{ENV['RBENV_ROOT']}/shims:#{ENV['PATH']}" : ENV['PATH']

rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"
set :timezone, 'Asia/Tokyo'

every 1.day, at: '7:50 pm' do
  rake 'reward:send_reward'
end
