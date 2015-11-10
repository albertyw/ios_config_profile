class IOSConfigProfile::SetDeviceNamePayload < Hash
  include IOSConfigProfile::BasicPayload

  attr_accessor :new_device_name

  def initialize(new_device_name)
    self.new_device_name = new_device_name
    require_attributes :new_device_name
    merge! set_device_name_payload
  end

  private

  def set_device_name_payload
    {
      "RequestType" => "Settings",
      "Settings" => [{ "Item" => "DeviceName", "DeviceName" => new_device_name }],
    }
  end
end
