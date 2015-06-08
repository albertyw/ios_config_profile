module IOSConfigProfile
  class SecurityPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :content, :password

    def initialize(content, password)
      self.content = content
      self.password = password
      require_attributes :content, :password
      merge! security_payload
    end

    private

    def security_payload
      {
        'Password' => password,
        'PayloadUUID' => uuid,
        'PayloadContent' => StringIO.new(content),
        'PayloadCertificateFileName' => 'identity.p12',

        'PayloadType' => 'com.apple.security.pkcs12',
        'PayloadVersion' => 1,
        'PayloadIdentifier' => 'com.cellabusipcu.profile.credential',
        'PayloadDisplayName' => 'Security',
        'PayloadDescription' => 'Provides device authentication (certificate or identity).',
        'PayloadOrganization' => 'Cellabus, Inc.'
      }
    end
  end
end