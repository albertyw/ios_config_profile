module IOSConfigProfile
  class InstallProfilePayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :profile

    def initialize(profile)
      self.profile = profile
      require_attributes :profile
      merge! install_profile_payload
    end

    private

    def install_profile_payload
      {
        "RequestType" => "InstallProfile",
        "Payload" => StringIO.new(profile),
      }
    end
  end
end
