require "spec_helper"

describe IOSConfigProfile do
  context "@@root_domain" do
    after :all do
      IOSConfigProfile.root_domain = "com.cellabus"
    end

    it "has a root domain" do
      expect(IOSConfigProfile.root_domain).to eq "com.cellabus"
    end

    it "can set a root_domain" do
      example = "com.example"
      IOSConfigProfile.root_domain = example
      expect(IOSConfigProfile.root_domain).to eq example
    end
  end

  context "@@organization" do
    after :all do
      IOSConfigProfile.organization = "Cellabus, Inc."
    end

    it "has an organization" do
      expect(IOSConfigProfile.organization).to eq "Cellabus, Inc."
    end

    it "can set an organization" do
      example = "example"
      IOSConfigProfile.organization = example
      expect(IOSConfigProfile.organization).to eq example
    end
  end
end
