require 'ios-cert-enrollment'
require 'ios_config_profile/version'
require 'ios_config_profile/basic_payload'
require 'ios_config_profile/configuration_payload'
require 'ios_config_profile/mdm_payload'
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/ios_config_profile/configuration/*.rb', &method(:require))
Dir.glob(project_root + '/ios_config_profile/mdm/*.rb', &method(:require))
