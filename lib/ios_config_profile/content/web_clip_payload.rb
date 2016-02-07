module IOSConfigProfile
  class WebClipPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :url, :label, :icon

    def initialize(url, label, icon)
      self.url = url
      self.label = label
      self.icon = icon
      require_attributes :url, :label
      merge! web_clip_payload
    end

    private

    def web_clip_payload
      {
        "PayloadContent" => [{
          "URL" => url,
          "Label" => label,
          "Icon" => StringIO.new(icon),
          "IsRemovable" => false,
          "PayloadType" => "com.apple.webClip.managed",
          "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}.webclip",
          "PayloadDescription" => "Add home screen website bookmark",
          "PayloadUUID" => uuid,
          "PayloadVersion" => 1,
        }],
        "PayloadType" => "Configuration",
        "PayloadDisplayName" => "#{IOSConfigProfile.organization} Web Clip",
        "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}.config.mdm.#{SecureRandom.urlsafe_base64}",
        "PayloadUUID" => uuid,
        "PayloadVersion" => 1,
      }
    end
  end
end
