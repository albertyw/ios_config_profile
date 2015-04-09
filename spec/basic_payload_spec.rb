require 'spec_helper'

describe IOSConfigProfile::BasicPayload do
  class Payload
    include IOSConfigProfile::BasicPayload

    def to_plist
      'payload in plist format'
    end
  end

  describe '#to_encrypted_payload' do
    let(:payload) { Payload.new }

    subject { payload.to_encrypted_payload }

    it { is_expected.to be_an IOSConfigProfile::EncryptedPayload }
    its(:payload) { should == 'payload in plist format' }
  end

  describe '#to_command_payload' do
    let(:payload) { Payload.new }

    subject { payload.to_command_payload }

    it { is_expected.to be_a IOSConfigProfile::CommandPayload }
    its(:command) { should == payload }
  end
end
