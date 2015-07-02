require 'spec_helper'

describe IOSConfigProfile::EraseDevicePayload do
  subject { IOSConfigProfile::EraseDevicePayload }

  describe "#initialize" do
    it "has an EraseDevice payload" do
      expect(subject.new['RequestType']).to eq 'EraseDevice'
    end
  end
end
