# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/rails'

Capybara.configure do |config|
  config.server = :puma, { Silent: true }
end
