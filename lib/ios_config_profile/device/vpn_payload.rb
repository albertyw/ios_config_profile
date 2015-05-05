module IOSConfigProfile
  class VPNPayload < Hash
    include IOSConfigProfile::BasicPayload

    # Hash containing :override_primary, :vpn_type
    attr_accessor :vpn_config

    def initialize(config)
      self.vpn_config = config
      require_attributes :vpn_config
      merge! vpn_payload
    end

    private

    def vpn_payload
      {
        'PayloadContent' => [{
          'PayloadType' => 'com.apple.vpn.managed',
          'PayloadIdentifier' => 'com.cellabus.vpn',
          'PayloadDescription' => 'Set up VPN networking access',
          'PayloadUUID' => uuid,
          'PayloadVersion' => 1,
          'UserDefinedName' => 'VPN',
          'OverridePrimary' => vpn_config[:override_primary],
          'VPNType' => vpn_config[:vpn_type],
          'OnDemandEnabled' => 0,
          'OnDemandRules' => [],
          'VendorConfig' => get_vendor_config,
        }],
        'PayloadType' => 'Configuration',
        'PayloadDisplayName' => 'Cellabus VPN Configuration',
        'PayloadIdentifier' => 'com.cellabus.vpn',
        'PayloadUUID' => uuid,
        'PayloadVersion' => 1,
      }
    end

    def get_vendor_config
      if vpn_config[:vpn_type] == 'L2TP'
        get_l2tp_config
      elsif vpn_config[:vpn_type] == 'PPTP'
        raise NotImplementedError
      elsif vpn_config[:vpn_type] == 'IPSec'
        get_ipsec_config
      elsif vpn_config[:vpn_type] == 'IKEv2'
        raise NotImplementedError
      elsif vpn_config[:vpn_type] == 'AlwaysOn'
        raise NotImplementedError
      else
        raise NotImplementedError
      end
    end

    def get_l2tp_config
      {} # TODO
    end

    def get_ipsec_config
      {} # TODO
    end
  end
end