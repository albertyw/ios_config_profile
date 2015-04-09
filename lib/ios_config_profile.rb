require 'ios-cert-enrollment'
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/ios_config_profile/*.rb', &method(:require))
Dir.glob(project_root + '/ios_config_profile/payload/*.rb', &method(:require))
