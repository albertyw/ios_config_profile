module IOSConfigProfile
  class ConfigurationPayload < IOSCertEnrollment::Profile

    def initialize(payload)
      super()
      self.payload = payload.to_plist
    end

    # Encrypts the profile, wraps it into configuration profile and signs it
    def encrypted_configuration(p7sign_certificates)
      encrypted_profile = encrypt p7sign_certificates
      configuration encrypted_profile.certificate
    end
  end
end