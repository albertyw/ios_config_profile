require 'spec_helper'

describe IOSConfigProfile::RemoveDocPayload do
  subject { IOSConfigProfile::RemoveDocPayload }

  describe "#initialize" do
    it "must be initialized with a doc's url" do
      payload = subject.new '1234'
      expect(payload['Command']['PersistentID']).to eq 'com.cellabus.files.1234'
      expect{subject.new nil}.to raise_error
    end
    it "has required payload values" do
      payload = subject.new '1234'
      expect(payload['Command']['RequestType']).to eq 'RemoveMedia'
      expect(payload['Command']['MediaType']).to eq 'Book'
      expect(payload['CommandUUID']).to be
    end
  end
end
