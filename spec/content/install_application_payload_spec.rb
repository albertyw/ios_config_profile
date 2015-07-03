require 'spec_helper'

describe IOSConfigProfile::InstallApplicationPayload do
  let(:install_application_payload_attributes) do
    {
      "RequestType" => "InstallApplication",
      "iTunesStoreID" => 265,
      "ManagementFlags" => 1,
    }
  end

  subject { IOSConfigProfile::InstallApplicationPayload.new 265 }

  it { is_expected.to eq(install_application_payload_attributes) }
end
