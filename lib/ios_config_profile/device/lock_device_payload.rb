class IOSConfigProfile::LockDevicePayload < Hash
  include IOSConfigProfile::BasicPayload

  def initialize
    merge! lock_device_payload
  end

  private

  def lock_device_payload
    {
      "RequestType" => "DeviceLock",
    }
  end
end
