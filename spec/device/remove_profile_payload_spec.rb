require "spec_helper"

describe IOSConfigProfile::RemoveProfilePayload do
  let(:remove_profile_payload_attributes) do
    {
      "RequestType" => "RemoveProfile",
      "Identifier" => "profile-identifier",
    }
  end

  subject { IOSConfigProfile::RemoveProfilePayload.new "profile-identifier" }

  it { is_expected.to eq(remove_profile_payload_attributes) }
end
