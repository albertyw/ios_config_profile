require "spec_helper"

describe IOSConfigProfile::RemoveDocPayload do
  subject { IOSConfigProfile::RemoveDocPayload }

  describe "#initialize" do
    it "must be initialized with a doc's url" do
      payload = subject.new "1234"
      expect(payload["PersistentID"]).to eq "#{IOSConfigProfile.root_domain}.files.1234"
      expect { subject.new nil }.to raise_error RuntimeError
    end
    it "has required payload values" do
      payload = subject.new "1234"
      expect(payload["RequestType"]).to eq "RemoveMedia"
      expect(payload["MediaType"]).to eq "Book"
    end
  end
end
