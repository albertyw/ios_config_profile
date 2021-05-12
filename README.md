# IOSConfigProfile

[![Gem Version](https://badge.fury.io/rb/ios_config_profile.svg)](https://badge.fury.io/rb/ios_config_profile)
[![Build Status](https://drone.albertyw.com/api/badges/albertyw/ios_config_profile/status.svg)](https://drone.albertyw.com/albertyw/ios_config_profile)
[![Dependency Status](https://img.shields.io/librariesio/release/rubygems/ios_config_profile.svg)](https://libraries.io/rubygems/ios_config_profile)
[![Code Climate](https://codeclimate.com/github/albertyw/ios_config_profile/badges/gpa.svg)](https://codeclimate.com/github/albertyw/ios_config_profile)
[![Test Coverage](https://codeclimate.com/github/albertyw/ios_config_profile/badges/coverage.svg)](https://codeclimate.com/github/albertyw/ios_config_profile/coverage)
[![security](https://hakiri.io/github/albertyw/ios_config_profile/master.svg)](https://hakiri.io/github/albertyw/ios_config_profile/master)

Gem for creating and manipulating Apple Configuration Profiles and Mobile
Device Management (MDM) Protocols

## Installation

Add this to your Gemfile

```ruby
gem 'ios-cert-enrollment', git: 'https://github.com/albertyw/ios-cert-enrollment'
gem 'ios_config_profile'
```

This gem requires IOSCertEnrollment.  The [rubygems version](https://rubygems.org/gems/ios-cert-enrollment) works
but it is highly recommended to use an [updated version](https://github.com/albertyw/ios-cert-enrollment).

## Usage

Apple Configuration Profiles are Property List (plist) files a type of XML file.
The plist gem converts hashes into plist files.

For a given configuration profile, you can initialize the class and export it
into a plist string.  For example:

```ruby
payload = IOSConfigProfile::InstallBookPayload.new '12345'
payload = payload.to_command_payload
```

## Development

To run tests - `bundle exec rspec`
