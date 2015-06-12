module IOSConfigProfile
  class InstalledApplicationListPayload < Hash
    include BasicPayload

    def initialize
      merge! installed_application_list_request_payload
    end

    private

    def installed_application_list_request_payload
      {
          'RequestType' => 'InstalledApplicationList'
      }
    end
  end
end
