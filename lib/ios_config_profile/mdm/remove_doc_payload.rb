module IOSConfigProfile
  class RemoveDocPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :doc_url

    def initialize(doc_url)
      @doc_url = doc_url
      require_attributes :doc_url
      merge! install_doc_payload
    end

    private

    def install_doc_payload
      {
          'RequestType' => 'RemoveMedia',
          'MediaType' => 'Book',
          'PersistentID' => "com.cellabus.files.#{doc_url}"
      }
    end
  end
end