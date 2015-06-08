require 'spec_helper'

describe IOSConfigProfile::MDMPayload do
  let(:mdm_payload_attributes) do
    {
      'Topic' => 'user id from apple push notification certificate',
      'ServerURL' => 'https://example.com/command',
      'CheckInURL' => 'https://example.com/checkin',
      'PayloadUUID' => '00000000-0000-0000-0000-000000000000',
      'IdentityCertificateUUID' => '11111111-1111-1111-1111-111111111111',

      'SignMessage' => false,
      'AccessRights' => 8191,
      'UseDevelopmentAPNS' => false,
      'CheckOutWhenRemoved' => true,

      'PayloadType' => 'com.apple.mdm',
      'PayloadVersion' => 1,
      'PayloadIdentifier' => 'com.cellabusipcu.profile.mdm',
      'PayloadDisplayName' => 'Mobile Device Management',
      'PayloadDescription' => 'Configures Mobile Device Management',
      'PayloadOrganization' => 'Cellabus, Inc.'
    }
  end

  before do
    allow_any_instance_of(IOSConfigProfile::MDMPayload).to receive_messages random_uuid: "00000000-0000-0000-0000-000000000000"
  end

  subject do
    url = 'https://example.com'
    security_payload = double uuid: '11111111-1111-1111-1111-111111111111'
    topic = 'user id from apple push notification certificate'
    IOSConfigProfile::MDMPayload.new(url, security_payload, topic)
  end

  it { is_expected.to eq(mdm_payload_attributes) }
end
