require 'spec_helper'

describe IOSConfigProfile::DEPPayload do
  subject { IOSConfigProfile::DEPPayload.new "https://example.com", 'topic', 'identity', 'password' }

  let(:mdm_payload) { double IOSConfigProfile::MDMPayload }
  let(:security_payload) { double IOSConfigProfile::SecurityPayload }

  before do
    allow(IOSConfigProfile::MDMPayload).to receive(:new).and_return mdm_payload
    allow(IOSConfigProfile::SecurityPayload).to receive(:new).and_return security_payload
  end

  it "has two payloads" do
    expect(subject['PayloadContent']).to eq([mdm_payload, security_payload])
    expect(subject['PayloadType']).to eq 'Configuration'
  end
end
