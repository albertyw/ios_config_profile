module IOSConfigProfile
  class AppLockPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :app_bundle_id

    def initialize(app_bundle_id)
      self.app_bundle_id = app_bundle_id
      require_attributes :app_bundle_id
      merge! app_lock_payload
    end

    private

    def app_lock_payload
      {
        "PayloadContent" => [{
          "App" => { "Identifier" => app_bundle_id },
          "PayloadType" => "com.apple.app.lock",
          "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}applock.profile.mdm",
          "PayloadDescription" => "Lock device to an app",
          "PayloadUUID" => uuid,
          "PayloadVersion" => 1,
        }],
        "PayloadType" => "Configuration",
        "PayloadDisplayName" => "#{IOSConfigProfile.organization} App Lock",
        "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}applock.profile.mdm",
        "PayloadUUID" => uuid,
        "PayloadVersion" => 1,
      }
    end
  end
end
