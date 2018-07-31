require 'simplecov'; SimpleCov.start
ENV['RACK_ENV'] = "test"
require 'rack/test'
require 'capybara/rspec'

require_relative '../app/main.rb'

require 'database_rewinder'
RSpec.configure do |config|
  config.before(:suite){ DatabaseRewinder.clean_all }
  config.after(:each){ DatabaseRewinder.clean }
end

class MyApp
  module IntegrationTest
    def app
      @app ||= MyApp
    end

    def self.included(cls)
      cls.before(:all){ Capybara.app = app }
    end
  end
end
