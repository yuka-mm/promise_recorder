# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# 設定系のgem
gem 'cancancan'
gem 'dockerfile-rails', '>= 1.6', group: :development
gem 'dotenv-rails'
gem 'enum_help'
gem 'font-awesome-sass'
gem 'meta-tags'
gem 'mini_racer'
gem 'omniauth', '~> 1.9.1'
gem 'omniauth-line'
gem 'omniauth-rails_csrf_protection'
gem 'rails_admin', '~> 3.0'
gem 'rails-i18n'
gem 'redis'
gem 'sassc-rails'
gem 'sidekiq'
gem 'sidekiq-cron', '~> 1.2'

# 機能系のgem
gem 'devise', '~> 4.9.0'
gem 'happybirthday'
gem 'kaminari'
gem 'line-bot-api'
gem 'simple_calendar'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'letter_opener_web', '~> 2.0'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :production do
  gem 'pg', '~> 1.1'
end
