module IOSConfigProfile
  class InstallMarketAppPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :manifest_url

    def initialize(manifest_url)
      self.manifest_url = manifest_url
      require_attributes :manifest_url
      merge! install_market_app_payload
    end

    private

    def install_market_app_payload
      {
          'RequestType' => 'InstallApplication',
          'ManifestURL' => manifest_url,
          'ManagementFlags' => 1
      }
    end
  end
end
