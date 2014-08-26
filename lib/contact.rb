class Contact
  @@all_contacts = []

  def initialize (name)
    @name = name
    @phones = []
    @emails = []
    @addresses = []
  end

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def save
    @@all_contacts << self
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
#   def Contact.list_contacts
#     current_lst = ""
#     @@all_contacts.each do |contact|
#       current_lst += "#{contact.name}\n"
#     end
#     current_lst
#   end

#   def Contact.contact_search(contact_name)
#     current_contact = Object.new
#     @@all_contacts.each do |contact|
#       if contact.name == contact_name
#         current_contact = contact
#       end
#     end
#     current_contact
#   end



#   def save_phone(phone)
#     @phone_numbers << phone
#   end

#   def list_phone
#     current_lst = ""
#     @phone_numbers.each do |number|
#       current_lst += "#{phone.phone_number}\n"
#     end
#     current_lst
#   end

#   def save_emails(email)
#     @emails << email
#   end



#   def save_address(address)
#     @addresses << address
#   end

#   def list_address
#     current_lst = ""
#     @addresses.each do |address|
#       current_lst += "#{address.address}"
#     end
#     current_lst
#   end

#   def edit_name(new_name)
#     @name = new_name
#   end

#   def contact_delete
#     @@all_contacts.delete(self)
#   end
# end

