# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.1'

# admin area
gem 'activeadmin', '~> 3.3.0'

gem 'dartsass', '~> 1.49'

# user auth boilerplate
gem 'devise', '~> 4.9', '>= 4.9.4'

# https://github.com/thoughtbot/factory_bot
gem 'factory_bot', '~> 6.4', '>= 6.4.6'

# https://github.com/thoughtbot/factory_bot_rails
gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

gem 'json', '>= 2.10.2'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# 3/2025 vulnerability fix
gem 'nokogiri', '>= 1.18.4'

# use Postgres
gem 'pg', '~> 1.5', '>= 1.5.6'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.6'

# upgrade from rack 3.1.4 because of vulnerability
gem 'rack', '>= 3.1.12'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.2', '>= 7.2.2.1'

# Use Redis adapter to run Action Cable in production
gem 'redis', '>= 4.0.1'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb

# ### App-specific gems ### #

gem 'vite_rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  gem 'dartsass-rails', '~> 0.5.1'

  # https://github.com/faker-ruby/faker
  gem 'faker'

  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 6.1', '>= 6.1.2'

  # https://github.com/rubocop/rubocop
  gem 'rubocop', '~> 1.63', require: false

  # https://github.com/rubocop/rubocop-capybara
  gem 'rubocop-capybara', '~> 2.20'

  # https://github.com/discourse/rubocop-discourse

  # https://github.com/rubocop/rubocop-rails/
  gem 'rubocop-rails', '~> 2.24', '>= 2.24.1'

  # https://github.com/rubocop/rubocop-rspec
  gem 'rubocop-rspec', '~> 2.29', '>= 2.29.1'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'rspec', '~> 3.13'
  gem 'webdrivers', '= 5.3.0'
end
