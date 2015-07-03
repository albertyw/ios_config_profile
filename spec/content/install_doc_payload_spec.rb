require 'spec_helper'

describe IOSConfigProfile::InstallDocPayload do
  subject { IOSConfigProfile::InstallDocPayload }

  describe "#initialize" do
    it "has the correct payload" do
      payload = subject.new('asdf', 'qwer')
      expect(payload['RequestType']).to eq 'InstallMedia'
      expect(payload['MediaType']).to eq 'Book'
      expect(payload['MediaURL']).to eq 'asdf'
      expect(payload['Kind']).to eq 'pdf'
      expect(payload['Title']).to eq 'qwer'
    end
  end
end
