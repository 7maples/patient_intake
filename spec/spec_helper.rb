ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'vcr'

# Add this to load Capybara integration:
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  #Include Factory Girl syntax to simplify calls to factories
  config.include FactoryGirl::Syntax::Methods

  #Database Cleaner
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

