ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
 config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    end

    # config.before(:each, js: true) do
    #   DatabaseCleaner.strategy = :transaction
    # end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
