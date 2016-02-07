module IOSConfigProfile
  class InstallDocPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :filepicker_url, :name

    def initialize(filepicker_url, name)
      @filepicker_url = filepicker_url
      @name = name
      require_attributes :filepicker_url, :name
      merge! install_doc_payload
    end

    private

    def install_doc_payload
      {
        "RequestType" => "InstallMedia",
        "MediaURL" => filepicker_url,
        "MediaType" => "Book",
        "Kind" => "pdf",
        "Title" => name,
        "PersistentID" => "#{IOSConfigProfile.root_domain}.files.#{filepicker_url}",
      }
    end
  end
end
