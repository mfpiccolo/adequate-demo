require 'capybara/poltergeist'

Konacha.configure do |config|
  config.spec_dir     = "test/javascripts"
  config.spec_matcher = /_spec\.|_test\./
  config.stylesheets  = %w(application)
  config.driver = :poltergeist
end if defined?(Konacha)
