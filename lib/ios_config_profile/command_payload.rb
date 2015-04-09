require 'ios_config_profile'

module IOSConfigProfile
  class CommandPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_reader :command

    def initialize(command)
      @command = command
      require_attributes :command
      merge! command_payload
    end

    def install_profile(&block)
      self.command = InstallProfilePayload.new &block
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
