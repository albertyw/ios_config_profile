module IOSConfigProfile
  module BasicPayload
    def uuid
      SecureRandom.uuid
    end

    private

    def require_attributes(*names)
      names.each { |name| require_attribute name }
    end

    def require_attribute(name)
      send(name) or raise %{Required attribute "#{name}" is not present}
    end
  end
end
