module IOSConfigProfile
  class InstallBookPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :itunes_store_id

    def initialize(itunes_store_id)
      self.itunes_store_id = itunes_store_id
      require_attributes :itunes_store_id
      merge! install_book_payload
    end

    private

    def install_book_payload
      {
        "RequestType" => "InstallMedia",
        "iTunesStoreID" => itunes_store_id,
        "MediaType" => "Book",
      }
    end
  end
end
