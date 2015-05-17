module IOSConfigProfile
  class WebClipPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :url, :label, :icon

    def initialize(url, label, icon)
      self.url, self.label, self.icon = url, label, icon
      require_attributes :url, :label
      merge! web_clip_payload
    end

    private

    def web_clip_payload
      {
        'PayloadContent' => [{
          'URL' => url,
          'Label' => label,
          'Icon' => StringIO.new(icon),
          'IsRemovable' => false,
          'PayloadType' => 'com.apple.webClip.managed',
          'PayloadIdentifier' => 'com.cellabus.webclip',
          'PayloadDescription' => 'Add home screen website bookmark',
          'PayloadUUID' => uuid,
          'PayloadVersion' => 1
        }],
        'PayloadType' => 'Configuration',
        'PayloadDisplayName' => 'Cellabus Web Clip',
        'PayloadIdentifier' => "com.cellabus.config.mdm.#{SecureRandom.urlsafe_base64}",
        'PayloadUUID' => uuid,
        'PayloadVersion' => 1
      }
    end
  end
end