require 'spec_helper'

describe IOSConfigProfile::WebClipPayload do
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
      'PayloadOrganization' => ''
    }
  end

  subject { IOSConfigProfile::WebClipPayload.new 'asdf.com', 'ASDF', 'PNGasdf' }

  it 'contains valid Configuration entries' do
    expect(subject['PayloadType']).to eq 'Configuration'
    expect(subject['PayloadDisplayName']).to eq'Cellabus Web Clip'
  end

  it 'contains valid PayloadContent' do
    expect(subject['PayloadContent'][0]['URL']).to eq 'asdf.com'
    expect(subject['PayloadContent'][0]['Label']).to eq 'ASDF'
    expect(subject['PayloadContent'][0]['Icon'].string[0,3]).to eq 'PNG'
    expect(subject['PayloadContent'][0]['IsRemovable']).to be_falsey
    expect(subject['PayloadContent'][0]['PayloadType']).to eq 'com.apple.webClip.managed'
  end

  it 'can be turned into an encrypted payload' do
    expect(subject.to_encrypted_payload).to be
  end
end
