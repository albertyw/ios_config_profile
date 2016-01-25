module IOSConfigProfile
  class RemoveBookPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :itunes_store_id

    def initialize(itunes_store_id)
      self.itunes_store_id = itunes_store_id
      require_attributes :itunes_store_id
      merge! remove_book_payload
    end

    private

    def remove_book_payload
      {
        "RequestType" => "RemoveMedia",
        "MediaType" => "Book",
        "iTunesStoreID" => itunes_store_id,
      }
    end
  end
end
