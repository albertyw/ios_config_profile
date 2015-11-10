module IOSConfigProfile
  class DEPPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_reader :url, :topic, :identity_cert, :identity_cert_password

    def initialize(url, topic, identity_cert, identity_cert_password)
      @url = url
      @topic = topic
      @identity_cert = identity_cert
      @identity_cert_password = identity_cert_password
      require_attributes :url, :topic, :identity_cert, :identity_cert_password
      merge! dep_payload
    end

    private

    def dep_payload
      {
        "PayloadContent" => [mdm_payload, security_payload],
        "PayloadDescription" => "Cellabus MDM Enrollment Profile",
        "PayloadDisplayName" => "Cellabus MDM Enrollment Profile",
        "PayloadIdentifier" => "com.cellabus.mdm.enrollment.profile",
        "PayloadOrganization" => "Cellabus, Inc.",
        "PayloadRemovalDisallowed" => false,
        "PayloadType" => "Configuration",
        "PayloadUUID" => uuid,
        "PayloadVersion" => 1,
      }
    end

    def mdm_payload
      @mdm_payload ||= IOSConfigProfile::MDMPayload.new(url, security_payload, topic)
    end

    def security_payload
      @security_payload ||= IOSConfigProfile::SecurityPayload.new(identity_cert, identity_cert_password)
    end
  end
end
