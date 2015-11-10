module IOSConfigProfile
  module BasicPayload
    def uuid
      # Note that this should be cached so that external code can read the
      # uuid of a given payload without having to parse the payload itself
      @uuid ||= random_uuid
    end

    def to_command_payload
      CommandPayload.new(self)
    end

    def to_encrypted_payload
      EncryptedPayload.new(self)
    end

    private

    def random_uuid
      SecureRandom.uuid
    end

    def require_attributes(*names)
      names.each { |name| require_attribute name }
    end

    def require_attribute(name)
      send(name) || raise(%{Required attribute "#{name}" is not present})
    end
  end
end
