require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "ios_config_profile"
require "rspec/its"

IOSCertEnrollment.configure do |config|
  config.ssl_key = lambda { "test_ssl_key" }
  config.ssl_certificate = lambda { "test_ssl_certificate" }
  config.base_url = lambda { "https://example.com/" }
  config.identifier = "Test Identifier"
  config.display_name = "Test Display Name"
  config.organization = "Test Organization"
end
