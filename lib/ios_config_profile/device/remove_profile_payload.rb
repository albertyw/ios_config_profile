class IOSConfigProfile::RemoveProfilePayload < Hash
  include IOSConfigProfile::BasicPayload

  attr_accessor :device_profile_identifier

  def initialize(device_profile_identifier)
    self.device_profile_identifier = device_profile_identifier
    require_attributes :device_profile_identifier
    merge! remove_profile_payload
  end

  private

  def remove_profile_payload
    {
      "RequestType" => "RemoveProfile",
      "Identifier" => device_profile_identifier,
    }
  end
end
