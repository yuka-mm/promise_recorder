class RewardWorker
  include Sidekiq::Worker

  def perform
    require 'rake'
    Rails.application.load_tasks
    Rake::Task['reward:send_reward'].invoke
  end
end
