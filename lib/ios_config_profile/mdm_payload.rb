require 'ios_config_profile'

# Used for MDM protocols
module IOSConfigProfile
  class MDMPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_reader :command

    def initialize(command)
      @command = command
      require_attributes :command
      merge! command_payload
    end

    private

    def command_payload
      {
        'Command' => command,
        'CommandUUID' => uuid
      }
    end
  end
end
