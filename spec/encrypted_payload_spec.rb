require "spec_helper"

describe IOSConfigProfile::EncryptedPayload do
  let(:wrapped_payload) { double to_plist: "wrapped payload in plist form" }

  subject { IOSConfigProfile::EncryptedPayload.new wrapped_payload }

  its(:payload) { should == "wrapped payload in plist form" }

  # This way we ensure super was called in the #initialize
  its(:url) { should be }
  its(:identifier) { should be }
  its(:description) { should be }
  its(:display_name) { should be }
  its(:organization) { should be }

  describe "#encrypted_configuration" do
    it "can return an encrypted configuration" do
      mock = double
      expect(subject).to receive(:encrypt).with("cert").and_return(mock)
      expect(mock).to receive(:certificate).and_return("asdf")
      expect(subject).to receive(:configuration).and_return("encrypted_cert")
      expect(subject.encrypted_configuration("cert")).to eq "encrypted_cert"
    end
  end
end
