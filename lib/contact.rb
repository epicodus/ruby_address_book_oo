class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @addresses = []
    @emails = []
    @phone_numbers = []

  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def addresses
    @addresses
  end

  def emails
    @emails
  end

  def phone_numbers
    @phone_numbers
  end

  def save
    @@all_contacts << self
  end

  def push_address(new_address)
    @addresses << new_address
  end

  def push_email(email)
    @emails << email
  end

  def push_phone(new_phone)
    @phone_numbers << new_phone
  end

end
