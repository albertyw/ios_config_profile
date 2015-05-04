module IOSConfigProfile
  class ConfigurationPayload < Hash
    include IOSConfigProfile::BasicPayload

    # Encrypts the profile, wraps it into configuration profile and signs it
    def encrypt(p7sign_certificates)
      profile = IOSCertEnrollment::Profile.new
      profile.payload = self.to_plist
      encrypted_profile = profile.encrypt p7sign_certificates
      profile.configuration(encrypted_profile.certificate).sign
    end
  end
end
