require 'spec_helper'

describe IOSConfigProfile::BasicPayload do
  class Payload
    include IOSConfigProfile::BasicPayload

    def to_plist
      'payload in plist format'
    end
  end

  let(:payload) { Payload.new}

  describe "#uuid" do
    it "returns a uuid" do
      uuid1 = payload.uuid
      uuid2 = payload.uuid
      expect(uuid1).to_not eq uuid2
    end
  end

  describe '#to_configuration_payload' do
    let(:payload) { Payload.new }

    subject { payload.to_configuration_payload }

    it { is_expected.to be_an IOSConfigProfile::ConfigurationPayload }
    its(:payload) { should == 'payload in plist format' }
  end

  describe '#to_mdm_payload' do
    let(:payload) { Payload.new }

    subject { payload.to_mdm_payload }

    it { is_expected.to be_a IOSConfigProfile::MDMPayload }
    its(:command) { should == payload }
  end

  describe "#require_attributes" do
    it "will check for multiple attributes" do
      payload.send(:require_attributes, :to_plist, :uuid)
      expect{payload.send(:require_attributes, :to_plist, :asdf)}.to raise_error
    end
  end

  describe "#require_attribute" do
    it "will raise an error if the name doesn't exist" do
      payload.send(:require_attribute, :to_plist)
      expect{payload.send(:require_attribute, :asdf)}.to raise_error
    end
  end
end
