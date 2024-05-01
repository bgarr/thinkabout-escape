# frozen_string_literal: true

require 'selenium/webdriver'

Capybara.register_driver :headless_chrome do |app|
  selenium_options = Selenium::WebDriver::Chrome::Options.new(args: %w[
                                                                headless=new
                                                                window-size=1280,1920
                                                                no-sandbox
                                                                disable-setuid-sandbox
                                                                disable-gpu
                                                                disable-dev-shm-usage
                                                                --enable-logging
                                                                --log-level=0
                                                                --v=1
                                                              ])

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: selenium_options
  )
end

Capybara.javascript_driver = :headless_chrome
