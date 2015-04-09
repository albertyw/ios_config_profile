module IOSConfigProfile
  module BasicPayload
    def uuid
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
      send(name) or raise %{Required attribute "#{name}" is not present}
    end
  end
end
