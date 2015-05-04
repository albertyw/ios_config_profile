require 'spec_helper'

describe IOSConfigProfile::ConfigurationPayload do
  let(:payload) { IOSConfigProfile::ConfigurationPayload.new}

  it "should have a to_plist" do
    expect(payload.to_plist).to be
  end

  describe "#encrypt" do
    let(:cert) { ['asdf'] }
    it "can return an encrypted profile" do
      mock = double(certificate: 'asdf')
      expect_any_instance_of(IOSCertEnrollment::Profile).to receive(:encrypt).with(['asdf']).and_return(mock)
      expect_any_instance_of(IOSCertEnrollment::Profile).to receive(:configuration).once
      payload.encrypt(cert)
    end
  end
end
