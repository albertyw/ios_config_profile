class IOSConfigProfile::RemoveApplicationPayload < Hash
  include IOSConfigProfile::BasicPayload

  attr_accessor :bundle_id

  def initialize(bundle_id)
    self.bundle_id = bundle_id
    require_attributes :bundle_id
    merge! remove_application_payload
  end

  private

  def remove_application_payload
    {
        'RequestType' => 'RemoveApplication',
        'Identifier' => bundle_id
    }
  end
end
