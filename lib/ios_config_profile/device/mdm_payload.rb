module IOSConfigProfile
  class MDMPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_reader :url, :security_payload, :topic

    def initialize(url, security_payload, topic)
      raise "url must be https" if url[0, 5] != "https"
      @url = url
      @security_payload = security_payload
      @topic = topic
      require_attributes :url, :topic, :security_payload
      replace mdm_payload
    end

    private

    def mdm_payload
      {
        "Topic" => topic,
        "ServerURL" => "#{url}/command",
        "CheckInURL" => "#{url}/checkin",
        "PayloadUUID" => uuid,
        "IdentityCertificateUUID" => security_payload.uuid,

        "SignMessage" => false,
        "AccessRights" => 8191,
        "UseDevelopmentAPNS" => false,
        "CheckOutWhenRemoved" => true,

        "PayloadType" => "com.apple.mdm",
        "PayloadVersion" => 1,
        "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}ipcu.profile.mdm",
        "PayloadDisplayName" => "Mobile Device Management",
        "PayloadDescription" => "Configures Mobile Device Management",
        "PayloadOrganization" => IOSConfigProfile.organization,
      }
    end
  end
end
