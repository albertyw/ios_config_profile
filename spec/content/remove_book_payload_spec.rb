require 'spec_helper'

describe IOSConfigProfile::RemoveBookPayload do
  subject { IOSConfigProfile::RemoveBookPayload }

  describe "#initialize" do
    it "has the correct payload" do
      payload = subject.new('asdf')
      expect(payload['RequestType']).to eq 'RemoveMedia'
      expect(payload['MediaType']).to eq 'Book'
      expect(payload['iTunesStoreID']).to eq 'asdf'
    end
  end
end
