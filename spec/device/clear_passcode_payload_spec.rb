require 'spec_helper'

describe IOSConfigProfile::ClearPasscodePayload do
  subject { IOSConfigProfile::ClearPasscodePayload }

  describe "#initialize" do
    it "requires an unlock token" do
      token = 'asdf'
      payload = subject.new(token)
      expect(payload['RequestType']).to eq 'ClearPasscode'
      expect(payload['UnlockToken'].gets).to eq 'asdf'
    end
  end
end
