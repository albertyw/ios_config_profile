class IOSConfigProfile::RestrictionsPayload < Hash
  include IOSConfigProfile::BasicPayload

  def initialize(custom_values=nil)
    payload = generate_restrictions(custom_values)
    payload = add_boilerplate payload
    merge! payload
  end

  def self.available_payloads
    # key => [english description, default, (options)]
    {
      'allowAddingGameCenterFriends' => ['Allow adding Game Center friends', true],
      'allowAppInstallation' => ['Allow App Store installations and updates', true],
      'allowAppRemove' => ['Allow removal of apps from iOS device', true],
      'allowAssistant' => ['Allow Siri', true],
      'allowAssistantWhileLocked' => ['Allow Siri while device is locked', true],
      'allowCamera' => ['Allow camera usage', true],
      'allowCloudBackup' => ['Allow iCloud', true],
      'allowCloudDocumentSync' => ['Allow document and key-value syncing with iCloud', true],
      'allowCloudKeychainSync' => ['Allow cloud keychain synchronization', true],
      'allowDiagnosticSubmission' => ['Allow automatic submission of diagnostic reports to Apple', true],
      'allowExplicitContent' => ['Allow explicit music or video content from iTunes Store', true],
      'allowFingerprintForUnlock' => ['Allow Touch ID (fingerprint) to unlock device', true],
      'allowGlobalBackgroundFetchWhenRoaming' => ['Allow global background fetch activity when device is roaming', true],
      'allowInAppPurchases' => ['Allow in-app purchasing', true],
      'allowLockScreenControlCenter' => ['Allow Control Center on the Lock screen', true],
      'allowLockScreenNotificationView' => ['Allow Notifications view in Notification Center on the lock screen', true],
      'allowLockScreenTodayView' => ['Allow Today view in Notification Center on the lock screen', true],
      'allowMultiplayerGaming' => ['Allow multiplayer gaming', true],
      'allowOpenFromManagedToUnmanaged' => ['Allow documents in managed apps and accounts to be opened in unmanaged apps and accounts', true],
      'allowOpenFromUnmanagedToManaged' => ['Allow documents in unmanaged apps and accounts to be opened in managed apps and accounts', true],
      'allowOTAPKIUpdates' => ['Allow over-the-air PKI updates', true],
      'allowPassbookWhileLocked' => ['Allow Passbook notifications on the lock screen', true],
      'allowPhotoStream' => ['Allow Photo Stream', true],
      'allowSafari' => ['Allow Safari', true],
      'safariAllowAutoFill' => ['Allow Safari auto-fill', true],
      'safariForceFraudWarning' => ['Force Safari fraud warning', true],
      'safariAllowJavascript' => ['Allow Safari to execute JavaScript', true],
      'safariAllowPopups' => ['Allow Safari to show pop-up tabs', true],
      'allowScreenShot' => ['Allow screenshots', true],
      'allowSharedStream' => ['Allow Shared Photo Stream', true],
      'allowUntrustedTLSPrompt' => ['Allow untrusted HTTPS certificates', true],
      'allowVideoConferencing' => ['Allow video conferencing', true],
      'allowVoiceDialing' => ['Allow voice dialing', true],
      'allowYouTube' => ['Allow YouTube', true],
      'allowiTunes' => ['Allow iTunes Music Store', true],
      'forceAssistantProfanityFilter' => ['Force profanity filter assistant', false],
      'forceEncryptedBackup' => ['Force encrypt all backups', false],
      'forceITunesStorePasswordEntry' => ['Force require iTunes password for each transaction', false],
      'forceLimitAdTracking' => ['Limit ad tracking', false],
      'forceAirPlayOutgoingRequestsPairingPassword' => ['Force all devices receiving AirPlay requests from this device to use a pairing password', false],
      'forceAirPlayIncomingRequestsPairingPassword' => ['Force all devices sending AirPlay requests to this device to use a password', false],
      'allowManagedAppsCloudSync' => ['Allow managed applications to use cloud sync', true],
      'allowActivityContinuation' => ['Allow Activity Continuation', true],
      'allowEnterpriseBookBackup' => ['Allow Enterprise books to be backed up', true],
      'allowEnterpriseBookMetadataSync' => ['Allow Enterprise book notes and highlights to be synchronized', true],
    }
  end

  def self.available_supervised_payloads
    # key => [english description, default, (options)]
    {
      'allowAccountModification' => ['Allow account modification', true],
      'allowAirDrop' => ['Allow AirDrop', true],
      'allowAppCellularDataModification' => ['Allow changes to cellular data usage for apps', true],
      'allowAssistantUserGeneratedContent' => ['Allow Siri to query user-generated content from the web', true],
      'allowBookstore' => ['Allow iBookstore', true],
      'allowBookstoreErotica' => ['Allow iBookstore media that has been tagged as erotica', true],
      'allowChat' => ['Allow Messages app', true],
      'allowFindMyFriendsModification' => ['Allow changes to Find My Friends', true],
      'allowGameCenter' => ['Allow Game Center', true],
      'allowHostPairing' => ['Allow host pairing (except for supervision host)', true],
      'allowUIConfigurationProfileInstallation' => ['Allow installing configuration profiles and certificates interactively', true],
      'allowEraseContentAndSettings' => ['Allow the "Erase All Content And Settings" option in the Reset UI', true],
      'allowSpotlightInternetResults' => ['Allow Spotlight to return Internet search results', true],
      'allowEnablingRestrictions' => ['Enable the "Enable Restrictions" option in the Restrictions UI in Settings', true],
      'allowPodcasts' => ['Allow podcasts', true],
      'allowDefinitionLookup' => ['Allow definition lookups', true],
      'allowPredictiveKeyboard' => ['Allow predictive keyboards', true],
      'allowAutoCorrection' => ['Allow keyboard auto-correction', true],
      'allowSpellCheck' => ['Allow keyboard spell-check', true],
    }
  end

  private

  def restrictions_payload
    default_payload = {}
    IOSConfigProfile::RestrictionsPayload.available_payloads.each{|k,v| default_payload[k] = v[1]}
    IOSConfigProfile::RestrictionsPayload.available_supervised_payloads.each{|k,v| default_payload[k] = v[1]}
    default_payload
  end

  def generate_restrictions(custom_values)
    if not custom_values.is_a? Hash
      custom_values = Hash.new
    end
    default_payload = restrictions_payload
    payload = {}
    custom_values.each do |k,v|
      if not default_payload.has_key? k
        next
      end
      if default_payload[k].to_s != v.to_s
        payload[k] = v
      end
    end
    payload
  end

  def add_boilerplate(payload)
    content = {
        'PayloadType' => 'com.apple.applicationaccess',
        'PayloadIdentifier' => 'com.cellabus.restrictions',
        'PayloadDescription' => 'Restrict device capabilities',
        'PayloadUUID' => uuid,
        'PayloadRemovalDisallowed' => true,
        'PayloadVersion' => 1
    }.merge payload
    {
      'PayloadContent' => [content],
      'PayloadType' => 'Configuration',
      'PayloadDisplayName' => 'Cellabus Device Restrictions',
      'PayloadIdentifier' => "com.cellabus.config.mdm.#{SecureRandom.urlsafe_base64}",
      'PayloadUUID' => uuid,
      'PayloadVersion' => 1
    }
  end
end
