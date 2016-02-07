module IOSConfigProfile
  @@root_domain = 'com.cellabus'

  def self.root_domain= x
    @@root_domain = x
  end
  def self.root_domain
    @@root_domain
  end
end
