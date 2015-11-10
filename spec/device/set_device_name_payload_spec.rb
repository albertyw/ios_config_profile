require "spec_helper"

describe IOSConfigProfile::SetDeviceNamePayload do
  subject { IOSConfigProfile::SetDeviceNamePayload }

  describe "#initialize" do
    it "has an Settings payload" do
      payload = subject.new("asdf")
      expect(payload["RequestType"]).to eq "Settings"
      expect(payload["Settings"][0]["Item"]).to eq "DeviceName"
      expect(payload["Settings"][0]["DeviceName"]).to eq "asdf"
    end
  end
end
