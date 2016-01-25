module IOSConfigProfile
  class InstallApplicationPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :itunes_store_id

    def initialize(itunes_store_id)
      self.itunes_store_id = itunes_store_id
      require_attributes :itunes_store_id
      merge! install_application_payload
    end

    private

    def install_application_payload
      {
        "RequestType" => "InstallApplication",
        "iTunesStoreID" => itunes_store_id,
        "ManagementFlags" => 1,
      }
    end
  end
end
