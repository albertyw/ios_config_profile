require 'spec_helper'

describe IOSConfigProfile::SCEPPayload do
  subject { IOSConfigProfile::SCEPPayload }
  let(:url) { 'https://asdf.com/' }

  describe "#initialize" do
    it "must be initialized with an SCEP server url" do
      payload = subject.new url
      expect(payload['URL']).to eq url
      expect(payload['PayloadType']).to eq 'com.apple.security.scep'
    end
  end
end
