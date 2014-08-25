require './lib/number.rb'
require './lib/number'

class Contact
  attr_accesor(:name, :phone_numbers, :emails, :addresses)
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def initialize (name)
    @name = name
    @phone_numbers = []
    @emails = []
    @addresses = []
    save
  end

  def save
    @@all_contact << self
  end

  def save_phone(phone)
    @phone_numbers << phone
  end  

  def list_phone
    current_lst = ""
    @phone_numbers.each do |number|
      current_lst += "#{number.phone_number}\n"
  end

  def save_emails(email)
    @emails << email
  end

  def add_addresses(addresses)
    @addresses = Mail.new(addresses)
  end

  def addresses
    @addresses.all
  end

  def number
    @number
  end

  def add_email(email)
    @email = email
  end

  def email
    @email
  end

  def add_mailing(address)
    @address = address
  end

  def mailing
    @address
  end
end



