require "spec_helper"

describe IOSConfigProfile::RestrictionsPayload do
  let(:payload) { { "allowAppInstallation" => true } }
  let(:crap_payload) { { "asdf" => false } }

  describe "IOSConfigProfile::RestrictionsPayload.generate_restrictions" do
    it "defaults to empty payload" do
      expect(IOSConfigProfile::RestrictionsPayload.new.send(:generate_restrictions, nil).length).to eq(0)
    end
    it "allows for additional payloads" do
      payload["allowAppInstallation"] = false
      expect(IOSConfigProfile::RestrictionsPayload.new.send(:generate_restrictions, payload).length).to eq(1)
    end
    it "will ignore default values" do
      expect(IOSConfigProfile::RestrictionsPayload.new.send(:generate_restrictions, payload).length).to eq(0)
    end
    it "will ignore unrecognized values" do
      expect(IOSConfigProfile::RestrictionsPayload.new.send(:generate_restrictions, crap_payload).length).to eq(0)
    end
  end

  describe "IOSConfigProfile::RestrictionsPayload.new" do
    it "adds boilerplate on top of restrictions" do
      expect(IOSConfigProfile::RestrictionsPayload.new.length).to eq(6)
      expect(IOSConfigProfile::RestrictionsPayload.new["PayloadContent"][0].length).to eq(6)
      expect(IOSConfigProfile::RestrictionsPayload.new["PayloadContent"][0]["PayloadType"]).to eq("com.apple.applicationaccess")
    end
  end

  its(:length) { should == 6 }

  describe "available_payloads" do
    subject { IOSConfigProfile::RestrictionsPayload.available_payloads }
    it { is_expected.to be_instance_of Hash }
  end

  describe "available_supervised_payloads" do
    subject { IOSConfigProfile::RestrictionsPayload.available_supervised_payloads }
    it { is_expected.to be_instance_of Hash }
  end
end
