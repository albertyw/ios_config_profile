require 'spec_helper'

describe IOSConfigProfile::LockDevicePayload do
  subject { IOSConfigProfile::LockDevicePayload }

  describe "#initialize" do
    it "has an LockDevicePayload payload" do
      expect(subject.new['RequestType']).to eq 'DeviceLock'
    end
  end
end
