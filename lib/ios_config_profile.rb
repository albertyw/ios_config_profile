require "ios-cert-enrollment"
require "ios_config_profile/version"
require "ios_config_profile/basic_payload"
require "ios_config_profile/command_payload"
require "ios_config_profile/encrypted_payload"
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/ios_config_profile/device/*.rb", &method(:require))
Dir.glob(project_root + "/ios_config_profile/content/*.rb", &method(:require))
