ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "minitest/spec"
require "rails/test_help"
require "minitest/pride"
require "minitest/autorun"
require 'capybara/rails'
require 'capybara/dsl'

Capybara.javascript_driver = :webkit
Capybara.current_driver = Capybara.javascript_driver

class IntegrationHelper < MiniTest::Spec
  include Capybara::DSL

  before(:suite) do
    %x[bundle exec rake assets:precompile]
  end

  after do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end
end
MiniTest::Spec.register_spec_type( /Integration$/, IntegrationHelper )

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join("./test/support/**/*.rb")].sort.each { |f| require f }
