require 'ios_config_profile'

# Used for MDM protocols
module IOSConfigProfile
  class MDMPayload < Hash
    include IOSConfigProfile::BasicPayload

    def initialize
      merge! command_payload
    end

    def make_payload
      {}
    end

    protected

    def command_payload
      {
        'Command' => make_payload,
        'CommandUUID' => uuid
      }
    end
  end
end
