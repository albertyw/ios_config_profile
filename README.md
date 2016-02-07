# IOSConfigProfile

[![Gem Version](https://badge.fury.io/rb/ios_config_profile.svg)](https://badge.fury.io/rb/ios_config_profile)
[ ![Codeship Status for cellabus/ios_config_profile](https://codeship.com/projects/78639f70-c12a-0132-6290-3eb2295b72b3/status?branch=master)](https://codeship.com/projects/73471)
[![Dependency Status](https://gemnasium.com/cellabus/ios_config_profile.svg)](https://gemnasium.com/cellabus/ios_config_profile)
[![Code Climate](https://codeclimate.com/github/cellabus/ios_config_profile/badges/gpa.svg)](https://codeclimate.com/github/cellabus/ios_config_profile)
[![Test Coverage](https://codeclimate.com/github/cellabus/ios_config_profile/badges/coverage.svg)](https://codeclimate.com/github/cellabus/ios_config_profile/coverage)
[![security](https://hakiri.io/github/cellabus/ios_config_profile/master.svg)](https://hakiri.io/github/cellabus/ios_config_profile/master)

Gem for creating and manipulating Apple Configuration Profiles and Mobile
Device Management (MDM) Protocols

## Installation

Add this to your Gemfile

```ruby
gem 'ios-cert-enrollment', git: 'https://github.com/cellabus/ios-cert-enrollment'
gem 'ios_config_profile'
```

This gem requires IOSCertEnrollment.  The [rubygems version](https://rubygems.org/gems/ios-cert-enrollment) works
but it is highly recommended to use an [updated version](https://github.com/cellabus/ios-cert-enrollment).

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
