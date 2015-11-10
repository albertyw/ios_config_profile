require "stringio"

class IOSConfigProfile::ClearPasscodePayload < Hash
  include IOSConfigProfile::BasicPayload

  attr_accessor :unlock_token

  def initialize(unlock_token)
    self.unlock_token = unlock_token
    require_attributes :unlock_token
    merge! clear_passcode_payload
  end

  private

  def clear_passcode_payload
    {
      "RequestType" => "ClearPasscode",
      "UnlockToken" => StringIO.new(unlock_token),
    }
  end
end
