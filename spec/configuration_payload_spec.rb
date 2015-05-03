require 'spec_helper'

describe IOSConfigProfile::ConfigurationPayload do
  let(:wrapped_payload) { double to_plist: 'wrapped payload in plist form' }

  subject { IOSConfigProfile::ConfigurationPayload.new wrapped_payload }

  its(:payload) { should == 'wrapped payload in plist form' }

  # This way we ensure super was called in the #initialize
  its(:url) { should be }
  its(:identifier) { should be }
  its(:description) { should be }
  its(:display_name) { should be }
  its(:organization) { should be }

  describe "#encrypted_configuration" do
    it "can encrypt configuration" do
      profile = double certificate: 'asdf'
      expect(subject).to receive(:encrypt).and_return(profile)
      expect(subject).to receive(:configuration)
      subject.encrypted_configuration(['cert'])
    end
  end

  its(:payload) { should be }
end
