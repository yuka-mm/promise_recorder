if Rails.env.production?
  $redis = Redis.new(url: ENV['REDIS_URL'])
end