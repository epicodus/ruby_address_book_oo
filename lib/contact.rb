require './lib/number.rb'
require './lib/number'

class Contact
  attr_accesor(:name, :phone_numbers, :emails, :addresses)
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@names = []
    @@contacts = {}
  end

  def Contact.all
    @@contacts
  end

  def initialize (name)
    @name = name
    @@names << @name
    @@contacts[name] = self
  end

  def name
    @name
  end

  def add_number(number)
    @number = number
  end

  def add_numbers(extra)
    @add_numbers = Number.new(extra)
  end

  def numbers
    @add_numbers.all
  end

  def add_emails(emails)
    @emails = Email.new(emails)
  end

  def emails
    @emails.all
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



