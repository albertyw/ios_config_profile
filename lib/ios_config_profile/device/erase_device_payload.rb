module IOSConfigProfile
  class EraseDevicePayload < Hash
    include IOSConfigProfile::BasicPayload

    def initialize
      merge! erase_device_payload
    end

    private

    def erase_device_payload
      {
        "RequestType" => "EraseDevice",

      }
    end
  end
end
