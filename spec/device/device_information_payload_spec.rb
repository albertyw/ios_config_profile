require "spec_helper"

describe IOSConfigProfile::DeviceInformationPayload do
  let(:queries) do
    %w[
      UDID Languages Locales DeviceID OrganizationInfo iTunesStoreAccountIsActive iTunesStoreAccountHash
      DeviceName OSVersion BuildVersion ModelName Model ProductName SerialNumber
      DeviceCapacity AvailableDeviceCapacity BatteryLevel CellularTechnology IMEI
      MEID ModemFirmwareVersion IsSupervised IsDeviceLocatorServiceEnabled
      IsActivationLockEnabled IsDoNotDisturbInEffect DeviceID EASDeviceIdentifier
      ICCID BluetoothMAC WiFiMAC EthernetMACs CurrentCarrierNetwork SIMCarrierNetwork
      SubscriberCarrierNetwork CarrierSettingsVersion PhoneNumber VoiceRoamingEnabled
      DataRoamingEnabled IsRoaming PersonalHotspotEnabled SubscriberMCC SubscriberMNC
      CurrentMCC CurrentMNC
    ]
  end

  let(:device_information_payload_attributes) do
    {
      "Queries" => queries,
      "RequestType" => "DeviceInformation",
    }
  end

  subject { IOSConfigProfile::DeviceInformationPayload.new }

  it { is_expected.to eq(device_information_payload_attributes) }
end
