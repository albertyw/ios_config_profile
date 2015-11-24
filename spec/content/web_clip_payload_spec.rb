require "spec_helper"

describe IOSConfigProfile::WebClipPayload do
  subject { IOSConfigProfile::WebClipPayload.new "asdf.com", "ASDF", "PNGasdf" }

  it "contains valid Configuration entries" do
    expect(subject["PayloadType"]).to eq "Configuration"
    expect(subject["PayloadDisplayName"]).to eq "Cellabus Web Clip"
  end

  it "contains valid PayloadContent" do
    expect(subject["PayloadContent"][0]["URL"]).to eq "asdf.com"
    expect(subject["PayloadContent"][0]["Label"]).to eq "ASDF"
    expect(subject["PayloadContent"][0]["Icon"].string[0, 3]).to eq "PNG"
    expect(subject["PayloadContent"][0]["IsRemovable"]).to be_falsey
    expect(subject["PayloadContent"][0]["PayloadType"]).to eq "com.apple.webClip.managed"
  end

  it "can be turned into an encrypted payload" do
    expect(subject.to_encrypted_payload).to be
  end
end
