require 'sidekiq/cron'
return if ENV['COMPILE_ASSETS'] == 'true' || ENV['DOCKER_BUILD'] == 'true'

unless defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'
  Sidekiq::Cron::Job.create(
      name: 'Send task achievement rewards - every day at 10am',
      cron: '00 1 * * * ', # time is in UTC
      class: 'RewardWorker'
    )
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL']}
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
