# ios_config_profile

[ ![Codeship Status for cellabus/ios_config_profile](https://codeship.com/projects/78639f70-c12a-0132-6290-3eb2295b72b3/status?branch=master)](https://codeship.com/projects/73471)
[![Dependency Status](https://gemnasium.com/ebd39861065f9c7d45125b73b3774e35.svg)](https://gemnasium.com/cellabus/ios_config_profile)

Gem for creating and manipulating Apple Configuration Profiles and Mobile
Device Management (MDM) Protocols

# Usage

There are two types of payloads - Configuration and MDM payloads.  They are
both configured the same:

```ruby
payload = RemoveDocPayload('asdf')
payload           # {"Command"=>{"RequestType"=>"RemoveMedia",
payload.to_plist  # '<?xml version=\"1.0\" encoding...'

payload = AppLockPayload('1234')
payload           # {"PayloadContent"=>[{"App"=>{"Identifier"=>"1234"}, ...
payload.to_plist  # '<?xml version=\"1.0\" encoding...'
```

Configuration payloads can be encrypted:

```ruby
payload = AppLockPayload
```

# Development
To run tests - `bundle exec rspec`
