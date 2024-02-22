class SidekiqCronJob
  def self.schedule
    require 'sidekiq/cron'
    return if ENV['COMPILE_ASSETS'] == 'true' || ENV['DOCKER_BUILD'] == 'true'

    unless defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'
      Sidekiq::Cron::Job.create(
          name: 'Send task achievement rewards - every day at 10am',
          cron: '00 1 * * * ', # time is in UTC
          class: 'RewardWorker'
        )
    end
  end
end