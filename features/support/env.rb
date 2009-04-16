# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../../../../config/environment') # Radiant root's env
require 'cucumber/rails/world'
Cucumber::Rails.use_transactional_fixtures

require "#{RADIANT_ROOT}/spec/spec_helper"
require 'dataset'
Dataset::Resolver.default << (File.dirname(__FILE__) + "../../spec/datasets")

require 'webrat'

Webrat.configure do |config|
  config.mode = :rails
end

# Comment out the next two lines if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'webrat/rspec-rails'
