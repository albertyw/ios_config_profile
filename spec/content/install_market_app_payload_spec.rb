require "spec_helper"

describe IOSConfigProfile::InstallMarketAppPayload do
  let(:install_market_app_payload_attributes) do
    {
      "RequestType" => "InstallApplication",
      "ManifestURL" => "https://cellabus.com/cellabus.plist",
      "ManagementFlags" => 1,
    }
  end

  subject { IOSConfigProfile::InstallMarketAppPayload.new "https://cellabus.com/cellabus.plist" }

  it { is_expected.to eq(install_market_app_payload_attributes) }
end
