# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ios_config_profile/version"

Gem::Specification.new do |spec|
  spec.name          = "ios_config_profile"
  spec.version       = IOSConfigProfile::VERSION
  spec.authors       = ["Albert Wang"]
  spec.email         = ["git@albertyw.com"]
  spec.description   = "Generate Apple iOS configuration profiles and payloads"
  spec.summary       = "This gem provides an easy way to generate configuration profiles for use with Apple iOS devices. These profiles and payloads can be delivered via Apple MDM, Apple's Configurator, or the iPhone Configuration Utility (IPCU)."
  spec.homepage      = "https://github.com/albertyw/ios_config_profile"
  spec.license       = "AGPL-3.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "CFPropertyList", "~> 2.2"
  spec.add_dependency "plist", "~> 3.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", ">= 10"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rspec-its", "~> 1.2"
  spec.add_development_dependency "simplecov", "~> 0.15"
end
