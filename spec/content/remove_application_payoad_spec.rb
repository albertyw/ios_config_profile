require "spec_helper"

describe IOSConfigProfile::RemoveApplicationPayload do
  subject { IOSConfigProfile::RemoveApplicationPayload }

  describe "#initialize" do
    it "has the correct payload" do
      payload = subject.new("asdf")
      expect(payload["RequestType"]).to eq "RemoveApplication"
      expect(payload["Identifier"]).to eq "asdf"
    end
  end
end
