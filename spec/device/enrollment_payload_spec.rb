require 'spec_helper'

describe IOSConfigProfile::EnrollmentPayload do
  subject { IOSConfigProfile::EnrollmentPayload.new "https://example.com", 'topic', 'identity', 'password' }

  let(:mdm_payload) { double IOSConfigProfile::MDMPayload }
  let(:security_payload) { double IOSConfigProfile::SecurityPayload }

  before do
    allow(IOSConfigProfile::MDMPayload).to receive(:new).and_return mdm_payload
    allow(IOSConfigProfile::SecurityPayload).to receive(:new).and_return security_payload
  end

  it { is_expected.to eq([security_payload, mdm_payload]) }
  it 'can be turned into encrypted payload' do
    subject.to_encrypted_payload
  end
end
