module IOSConfigProfile
  @@root_domain = 'com.cellabus'

  def self.root_domain= x
    @@root_domain = x
  end
  def self.root_domain
    @@root_domain
  end

  @@organization = 'Cellabus, Inc.'

  def self.organization= x
    @@organization = x
  end
  def self.organization
    @@organization
  end
end
