require "spec_helper"

describe IOSConfigProfile::InstallBookPayload do
  subject { IOSConfigProfile::InstallBookPayload }

  describe "#initialize" do
    it "has the correct payload" do
      payload = subject.new("asdf")
      expect(payload["RequestType"]).to eq "InstallMedia"
      expect(payload["MediaType"]).to eq "Book"
      expect(payload["iTunesStoreID"]).to eq "asdf"
    end
  end
end
