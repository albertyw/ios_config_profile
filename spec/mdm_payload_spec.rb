require 'spec_helper'

describe IOSConfigProfile::MDMPayload do
  subject { IOSConfigProfile::MDMPayload.new 'command' }

  its(:command) { should == 'command' }

  it "should have a payload" do
    expect(subject['Command']).to eq 'command'
    expect(subject['CommandUUID']).to_not be_nil
  end
end
