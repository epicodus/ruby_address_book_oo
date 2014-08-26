class Contact
  @@contacts = []

  def initialize (name)
    @name = name
    @phones = []
    @emails = []
    @addresses = []
  end

  def Contact.all
    @@contacts
  end

  def Contact.clear
    @@contacts = []
  end

  def save
    @@contacts << self
  end

  def name
    @name
  end

  def emails
    @emails
  end

  def phones
    @phones
  end

  def addresses
    @addresses
  end

  def list_email
    current_lst = ""
    @emails.each do |mail|
      if current_lst == ""
        current_lst += "|" + mail.email + "|"
      else
        current_lst += mail.email + "|"
      end
    end
    current_lst
  end

  def list_phone
    current_lst = ""
    @phones.each do |number|
      if current_lst == ""
        current_lst += "|" + number.phone + "|"
      else
        current_lst += number.phone + "|"
      end
    end
    current_lst
  end

  def list_address
    current_lst = ""
    @addresses.each do |addr|
      if current_lst == ""
        current_lst += "|" + addr.address + "|"
      else
        current_lst += addr.address + "|"
      end
    end
    result
  end
end
