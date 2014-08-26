class Contact
  attr_reader :name

  attr_accessor :emails, :addresses, :phones

  @@contacts = []

  def initialize (name)
    @name = name
    @phones = []
    @emails = []
    @addresses = []
  end

  def self.all
    @@contacts
  end

  def self.clear
    @@contacts = []
  end

  def save
    @@contacts << self
  end

  def delete
    @@contacts.delete(self)
  end

  def ==(contact2)
    contact2 == nil ? false : (name == contact2.name && emails == contact2.emails && addresses == contact2.addresses && phones == contact2.phones)
  end
  def name
    @name
  end

  def list_email
    emails.collect {|email| email.eaddress}
  end

  def list_phone
    phones.collect {|phone| phone.display}
  end

  def list_address
    addresses.collect {|address| address.display}
end
