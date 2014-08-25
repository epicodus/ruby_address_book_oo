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
    @@all_contacts << self
  end

  def save_phone(phone)
    @phone_numbers << phone
  end  

  def list_phone
    current_lst = ""
    @phone_numbers.each do |number|
      current_lst += "#{number.phone_number}\n"
    end
    current_lst
  end

  def save_emails(email)
    @emails << email
  end

  def list_email
    current_lst = ""
    @emails.each do |mail|
      current_lst += "#{mail.email}\n"
    end
    current_lst
  end

  def save_address(address)
    @addresses << address
  end

  def list_address
    current_lst = ""
    @addresses.each do |address|
      current_lst += "#{address.address}"
    end
    current_lst
  end

  def edit_name(new_name)
    @name = new_name
  end

  def contact_delete
    @@all_contacts.delete(self)
  end
end

class Phone
  attr_accessor(:phone_number)
  
  def initialize(number)
    @phone_number = number
  end
end

class Email
  attr_accessor(:email)
  
  def initialize(email)
    @email = email
  end
end

class Address
  attr_accessor(:street, :city, :zip, :address)
  
  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
    @address = "#{street} #{city} #{state} #{zip}"
  end
end

