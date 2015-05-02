require 'spec_helper'

describe IOSConfigProfile::AppLockPayload do
  subject { IOSConfigProfile::AppLockPayload }

  describe "#initialize" do
    it "must be initialized with an app's bundle id" do
      payload = subject.new '1234'
      expect(payload['PayloadContent'][0]['App']['Identifier']).to eq '1234'
      expect{subject.new nil}.to raise_error
    end
    it "has required payload values" do
      payload = subject.new '1234'
      expect(payload['PayloadIdentifier']).to eq 'com.cellabusapplock.profile.mdm'
      expect(payload['PayloadContent'][0]['PayloadType']).to eq 'com.apple.app.lock'
    end
    it "has a uuid" do
      payload1 = subject.new '1234'
      payload2 = subject.new '1234'
      expect(payload1['PayloadUUID']).to_not eq payload2['PayloadUUID']
    end
  end
end
