require "spec_helper"

describe IOSConfigProfile::InstalledApplicationListPayload do
  let(:installed_application_list_payload_attributes) do
    {
      "RequestType" => "InstalledApplicationList",
    }
  end

  subject { IOSConfigProfile::InstalledApplicationListPayload.new }

  it { is_expected.to eq(installed_application_list_payload_attributes) }
end
