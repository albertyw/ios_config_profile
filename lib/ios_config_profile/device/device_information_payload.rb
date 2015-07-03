class IOSConfigProfile::DeviceInformationPayload < Hash
  include IOSConfigProfile::BasicPayload

  def initialize
    merge! device_information_request_payload
  end

  private

  def device_information_request_payload
    {
      'RequestType' => 'DeviceInformation',
      'Queries' => queries
    }
  end

  def queries
    GENERAL + ITUNES + DEVICE + NETWORK
  end

  GENERAL = %w[UDID Languages Locales DeviceID OrganizationInfo].freeze

  ITUNES = %w[iTunesStoreAccountIsActive iTunesStoreAccountHash].freeze

  DEVICE = %w[
    DeviceName
    OSVersion
    BuildVersion
    ModelName
    Model
    ProductName
    SerialNumber
    DeviceCapacity
    AvailableDeviceCapacity
    BatteryLevel
    CellularTechnology
    IMEI
    MEID
    ModemFirmwareVersion
    IsSupervised
    IsDeviceLocatorServiceEnabled
    IsActivationLockEnabled
    IsDoNotDisturbInEffect
    DeviceID
    EASDeviceIdentifier
  ].freeze

  NETWORK = %w[
    ICCID
    BluetoothMAC
    WiFiMAC
    EthernetMACs
    CurrentCarrierNetwork
    SIMCarrierNetwork
    SubscriberCarrierNetwork
    CarrierSettingsVersion
    PhoneNumber
    VoiceRoamingEnabled
    DataRoamingEnabled
    IsRoaming
    PersonalHotspotEnabled
    SubscriberMCC
    SubscriberMNC
    CurrentMCC
    CurrentMNC
  ].freeze
end
