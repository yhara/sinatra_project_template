require 'simplecov'; SimpleCov.start
ENV['RACK_ENV'] = "test"
require 'rack/test'

require_relative '../app/main.rb'

# Setup database_rewinder
require 'database_rewinder'
RSpec.configure do |config|
  config.before(:suite){ DatabaseRewinder.clean_all }
  config.after(:each){ DatabaseRewinder.clean }
end

# Setup capybara
require 'capybara/rspec'
class MyApp
  module SystemTest
    def app
      @app ||= MyApp
    end

    def self.included(cls)
      cls.before(:all){ Capybara.app = app }
    end
  end
end

# Setup capybara for `js: true`
require 'selenium-webdriver'
Capybara.register_driver :selenium_headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, {
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w(headless disable-gpu window-size=1680,1050),
      }
    )
  })
end
Capybara.javascript_driver = :selenium_headless_chrome
