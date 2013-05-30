ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Add this to load Capybara integration:
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  #Include Factory Girl syntax to simplify calls to factories
  config.include FactoryGirl::Syntax::Methods
end
