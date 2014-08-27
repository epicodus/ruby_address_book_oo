require './lib/contact.rb'
require './lib/address.rb'
require './lib/email.rb'
require './lib/phone.rb'

@current_contact

def menu
  loop do
    puts "Press '1' to create contact."
    puts "Press '2' to show or edit contacts."
    puts "Press '4' to delete a contact."
    puts "Press '0' to exit program."
    main_choice = gets.chomp
    exit if main_choice == '0'
    menu_selector(main_choice)
  end
end

def add_address(contact)
  puts "Add Mailing Address for #{contact.name}"

  street_address = prompt("#{contact.name}'s street address (blank to cancel)")
  return if street_address == ""

  city = prompt("#{contact.name}'s city")
  state = prompt("#{contact.name}'s state")
  zip_code = prompt("#{contact.name}'s zip code")

  address = Address.new(street_address, city, state, zip_code)

  unless prompt?("#{address.display} <-- is this correct")
    add_addresses(contact)
    return
  end

  contact.addresses << address

  add_addresses(contact) if prompt?("Add another address for #{contact.name}")

end

def add_email_addresses(contact)
  print_header("Add Email Address for #{contact.name}")

  email_addr = prompt("Enter a valid email address(blank to cancel)")
  return if email_addr.length == 0

  unless Email.valid?(email_addr)
    if prompt?("My imperfect regular expression insists that #{email_addr} is not a valid email address - try again")
      add_email_addresses(contact)
      return
    end
  end

  unless prompt?("#{email_addr} <-- is this correct")
    add_email_addresses(contact)
    return
  end

  contact.emails << Email.new(email_addr)

  if prompt?("Enter another email address")
    add_email_addresses(contact)
    return
  end
end
def list_contacts
  index = 0
  "#{index + 1}. #{Contact.name} \n Phone: #{@current_contact.list_phone} Email: #{Contact.email_list} Address: #{Contact.address_list}"
end

menu
