module IOSConfigProfile
  class RemoveDocPayload < MDMPayload

    attr_accessor :doc_url

    def initialize(doc_url)
      @doc_url = doc_url
      require_attributes :doc_url
      super()
    end

    def make_payload
      install_doc_payload
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