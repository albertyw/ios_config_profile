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
        "PayloadContent" => [{
          "PayloadType" => "com.apple.vpn.managed",
          "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}.vpn",
          "PayloadDescription" => "Set up VPN networking access",
          "PayloadUUID" => uuid,
          "PayloadVersion" => 1,
          "UserDefinedName" => "VPN",
          "OverridePrimary" => vpn_config[:override_primary],
          "VPNType" => vpn_config[:vpn_type],
          "OnDemandEnabled" => 0,
          "OnDemandRules" => [],
          "VendorConfig" => get_vendor_config,
        }],
        "PayloadType" => "Configuration",
        "PayloadDisplayName" => "#{IOSConfigProfile.organization} VPN Configuration",
        "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}.vpn",
        "PayloadUUID" => uuid,
        "PayloadVersion" => 1,
      }
    end

    def get_vendor_config
      if vpn_config[:vpn_type] == "L2TP"
        get_l2tp_config
      elsif vpn_config[:vpn_type] == "PPTP"
        raise NotImplementedError
      elsif vpn_config[:vpn_type] == "IPSec"
        get_ipsec_config
      elsif vpn_config[:vpn_type] == "IKEv2"
        raise NotImplementedError
      elsif vpn_config[:vpn_type] == "AlwaysOn"
        raise NotImplementedError
      else
        raise NotImplementedError
      end
    end

    def get_l2tp_config
      {
        "AuthName" => vpn_config[:auth_name],
        "AuthPassword" => vpn_config[:auth_password],
        "TokenCard" => false,
        "CommRemoteAccess" => vpn_config[:comm_remote_access],
        "AuthEAPPlugins" => [],
        "AuthProtocol" => [],
        "CCPMPPE40Enabled" => false,
        "CCPMPPE128Enabled" => false,
        "CCPEnabled" => false,
      }
    end

    def get_ipsec_config
      config = {
        "RemoteAddress" => vpn_config[:remote_address],
        "AuthenticationMethod" => vpn_config[:authentication_method],
        "XAuthName" => vpn_config[:x_auth_name],
        "XAuthEnabled" => vpn_config[:x_auth_enabled],
        "SharedSecret" => vpn_config[:shared_secret],
        "PayloadCertificateUUID" => vpn_config[:payload_certificate_uuid],
        "PromptForVPNPIN" => vpn_config[:prompt_for_vpn_pin],
      }
      if vpn_config[:authentication_method] == "SharedSecret"
        config["LocalIdentifier"] = vpn_config[:local_identifier]
        config["LocalIdentifierType"] = vpn_config[:local_identifier_type]
      end
      config
    end
  end
end
