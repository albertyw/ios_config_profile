module IOSConfigProfile
  class EnrollmentPayload < Array
    include IOSConfigProfile::BasicPayload

    attr_reader :url, :topic, :identity_cert, :identity_cert_password

    def initialize(url, topic, identity_cert, identity_cert_password)
      @url = url
      @topic = topic
      @identity_cert = identity_cert
      @identity_cert_password = identity_cert_password
      require_attributes :url, :topic, :identity_cert, :identity_cert_password
      push security_payload
      push mdm_payload
    end

    def mdm_payload
      @mdm_payload ||= IOSConfigProfile::MDMPayload.new(url, security_payload, topic)
    end

    def security_payload
      @security_payload ||= IOSConfigProfile::SecurityPayload.new(identity_cert, identity_cert_password)
    end
  end
end
