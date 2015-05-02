require 'spec_helper'

describe IOSConfigProfile::ConfigurationPayload do
  let(:wrapped_payload) { double to_plist: 'wrapped payload in plist form' }

  subject { IOSConfigProfile::ConfigurationPayload.new wrapped_payload }

  its(:payload) { should == 'wrapped payload in plist form' }

  # This way we ensure super was called in the #initialize
  its(:url) { should be }
  its(:identifier) { should be }
  its(:description) { should be }
  its(:display_name) { should be }
  its(:organization) { should be }
end
