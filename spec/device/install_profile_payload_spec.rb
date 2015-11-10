require "spec_helper"

describe IOSConfigProfile::InstallProfilePayload do
  subject { IOSConfigProfile::InstallProfilePayload }

  describe "#initialize" do
    it "has the correct payload" do
      payload = subject.new("asdf")
      expect(payload["RequestType"]).to eq "InstallProfile"
      expect(payload["Payload"].gets).to eq "asdf"
    end
  end
end
