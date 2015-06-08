require 'spec_helper'

describe IOSConfigProfile::SecurityPayload do
  let(:security_payload_attributes) do
    {
      'Password' => 'password',
      'PayloadUUID' => '00000000-0000-0000-0000-000000000000',
      'PayloadCertificateFileName' => 'identity.p12',

      'PayloadType' => 'com.apple.security.pkcs12',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => 'com.cellabusipcu.profile.credential',
      'PayloadDisplayName' => 'Security',
      'PayloadDescription' => 'Provides device authentication (certificate or identity).',
      'PayloadOrganization' => 'Cellabus, Inc.'
    }
  end

  before do
    allow_any_instance_of(IOSConfigProfile::SecurityPayload).to receive_messages random_uuid: "00000000-0000-0000-0000-000000000000"
  end

  subject { IOSConfigProfile::SecurityPayload.new('identity', 'password') }

  it { is_expected.to include security_payload_attributes }
  it 'contains valid PayloadContent' do
    expect(subject['PayloadContent'].read).to eq('identity')
  end
end
