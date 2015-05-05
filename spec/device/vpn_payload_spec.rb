require 'spec_helper'

describe IOSConfigProfile::VPNPayload do
  subject { IOSConfigProfile::VPNPayload }
  let(:config){ {override_primary: 'asdf', vpn_type: 'L2TP'} }

  describe "#initialize" do
    it "must be initialized with a config" do
      payload = subject.new config
      expect(payload.vpn_config).to eq config
      expect{subject.new nil}.to raise_error
    end
    it "has a uuid" do
      payload1 = subject.new config
      payload2 = subject.new config
      expect(payload1['PayloadUUID']).to_not eq payload2['PayloadUUID']
    end
  end

  describe "#vpn_payload" do
    subject { IOSConfigProfile::VPNPayload.new config }
    it "calls #get_vendor_config" do
      expect(subject).to receive(:get_vendor_config).once
      subject.send :vpn_payload
    end
    it "has a proper payload type" do
      expect(subject['PayloadContent'][0]['PayloadType']).to eq 'com.apple.vpn.managed'
    end
    it "has the proper vpn type" do
      expect(subject['PayloadContent'][0]['VPNType']).to eq 'L2TP'
    end
  end

  describe "#get_vendor_config" do
    subject {IOSConfigProfile::VPNPayload.new config }
    it "raises errors for unimplemented vpn types" do
      subject.send :get_vendor_config
      subject.vpn_config[:vpn_type] = 'AlwaysOn'
      expect{subject.send :get_vendor_config}.to raise_error NotImplementedError
      subject.vpn_config[:vpn_type] = 'asdf'
      expect{subject.send :get_vendor_config}.to raise_error NotImplementedError
    end
    it "calls appropriate function" do
      expect(subject).to receive(:get_l2tp_config).and_return 'asdf'
      expect(subject.send :get_vendor_config).to eq 'asdf'
    end
  end
end
