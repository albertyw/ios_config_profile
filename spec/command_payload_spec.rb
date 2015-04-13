require 'spec_helper'

describe IOSConfigProfile::CommandPayload do
  subject { IOSConfigProfile::CommandPayload.new 'command' }

  its(:command) { should == 'command' }

  it "should have a payload" do
    expect(subject['Command']).to eq 'command'
    expect(subject['CommandUUID']).to_not be_nil
  end
end
