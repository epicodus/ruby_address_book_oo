require './lib/contact.rb'
require './lib/address.rb'
require './lib/email.rb'
require './lib/phone.rb'

@current_contact

# def menu
#   loop do
#     puts "Press '1' to create contact."
#     puts "Press '2' to show or edit contacts."
#     puts "Press '4' to delete a contact."
#     puts "Press '0' to exit program."
#     main_choice = gets.chomp
#     exit if main_choice == '0'
#     menu_selector(main_choice)
#   end
# end

def prompt(message)
  print "#{message} => "
  gets.chomp
end

def prompt?(question)
  prompt(question + "(Y/N)?").upcase == "Y"
end


def add_addresses(contact)
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
  email_addres = prompt("Enter a valid email address(blank to cancel)")

  contact.emails << Email.new(email_addres)

  if prompt?("Enter another email address")
    add_email_addresses(contact)
    return
  end
end

def list_contacts
  index = 0
  "#{index + 1}. #{Contact.name} \n Phone: #{@current_contact.list_phone} Email: #{Contact.email_list} Address: #{Contact.address_list}"
end

def add_phone_numbers(contact)
  puts ("Add Phone Number for #{contact.name}")

  area_code = prompt("Enter Three-Digit Area Code(blank to cancel)")
  return if area_code.length == 0
  if /^\d{3}$/.match(area_code) == nil
    prompt("Invalid area code, enter to try again")
    add_phone_numbers(contact)
    return
  end

  phone_number = prompt("Enter a phone number (format: XXX-XXXX)")
  if /^\d{3}-\d{4}$/.match(phone_number) == nil
    prompt("Invalid phone number, enter to try again")
    add_phone_numbers(contact)
    return
  end

  contact_phone_number = Phone.new(area_code, phone_number)

  unless prompt?("#{contact_phone_number.display} <-- is this correct")
    add_phone_numbers(contact)
    return
  end

  contact.phone_numbers << contact_phone_number
  add_phone_numbers(contact) if prompt?("Add another phone number")
end


def create_new_contact
  puts ("Add New Contact")

  contact_name = prompt("New Contact Name (blank to cancel)")
  return nil if contact_name.length == 0

  unless prompt?("#{contact_name} <-- is this correct")
    create_new_contact
    return
  end

  contact = Contact.new(contact_name)
  add_addresses(contact) if prompt("Enter mailing address(es)")
  add_phone_numbers(contact) if prompt("Enter phone number(s)")
  add_email_addresses(contact) if prompt("Enter email address(es)")
  contact.save

  return contact

end

def view_contact(contact)
  puts ("Contact Info for #{contact.name}")

  puts "Addresses:"
  contact.display_addresses.each {|address| puts "\t * " + address}
  puts "Phone Numbers:"
  contact.display_phone_numbers.each {|phone| puts "\t * " + phone}
  puts "Email Addresses:"
  contact.display_emails.each {|email| puts "\t * " + email}
  puts "*" * 80
  puts
  prompt("Enter to continue")
end

def view_all_contacts
  puts ("View All Contacts")
  puts "Contacts:"
  Contact.all.each {|contact| puts "\t * #{contact.name}"}
  prompt("Press Enter to Continue")
end

def select_contact_menu(menu_title = "Select Contact")
  puts (menu_title)
  puts "Contacts:"

  if Contact.all.length == 0
    puts "\t NO CONTACTS EXIST YET!"
    prompt("Try again after you add some friends")
    return nil
  end

  Contact.all.each_index {|index| puts "\t #{index+1}: #{Contact.all[index].name}"}
  index_to_select = prompt("Select Contact Number").to_i
  return nil if index_to_select < 1 || index_to_select > Contact.all.length
  Contact.all[index_to_select-1]
end

def select_phone_number(contact, title="Select Phone Number for #{contact.name}")
  return if contact == nil
  puts (title)

  if contact.phone_numbers.length == 0
    prompt("No phone numbers exist for this contact yet")
    return
  end

  puts "Phone Numbers:"

  contact.phone_numbers.each_index {|index| puts "\t #{index+1}: #{contact.phone_numbers[index].display}"}
  number_to_select = prompt("Select Phone Number").to_i
  return nil if number_to_select < 1 || number_to_select > contact.phone_numbers.length
  contact.phone_numbers[number_to_select-1]
end

def select_email_address(contact, title="Select Email for #{contact.name}")
  return if contact == nil
  puts (title)
  if contact.emails.length == 0
    prompt("No email addresses exist for this contact yet")
    return
  end

  puts "Email Addresses:"

  contact.emails.each_index {|index| puts "\t #{index+1}: #{contact.emails[index].address}"}
  number_to_select = prompt("Select Email number").to_i
  return nil if number_to_select < 1 || number_to_select > contact.emails.length
  contact.emails[number_to_select-1]
end

def select_mailing_address(contact, title="Select Mailing Address for #{contact.name}")
  return if contact == nil
  puts (title)
  if contact.addresses.length == 0
    prompt("No mailing address exists for this contact yet")
    return
  end

  puts "Mailing Addresses:"

  contact.addresses.each_index {|index| puts "\t #{index+1}: #{contact.addresses[index].display}"}
  number_to_select = prompt("Select Address Number").to_i
  return nil if number_to_select < 1 || number_to_select > contact.addresses.length
  contact.addresses[number_to_select-1]
end

def menu_loop
  current_contact = nil

  while true do
    puts ("Welcome to Address Book for Ruby")
    puts ("1. New Contact | 2. Load Contact | 3. Delete Contact | 4. List All")
    puts ("0. exit")

    user_cmd = prompt("Command").upcase
    next if user_cmd.length == 0
    user_cmd.slice!(0, 2) if user_cmd.length > 2

    case user_cmd[0]
    when "0"
      return

    when "1"
      new_contact = create_new_contact
      new_contact.save unless new_contact == nil
      current_contact = new_contact if prompt?("Load contact immediately?")
      next

    when "2"
      current_contact = select_contact_menu("Load Contact")
      next

    when "3"
      contact_to_delete = select_contact_menu("Select a Contact to Delete")
      current_contact = nil if contact_to_delete == current_contact
      contact_to_delete.delete unless contact_to_delete == nil
      next

    when "4"
      view_contact(current_contact) unless current_contact == nil
      next

    when "A"
      view_all_contacts
      next


    when "+"
      case user_cmd[-1]
      when "P"
        add_phone_numbers(current_contact) unless current_contact == nil
        next

      when "E"
        add_email_addresses(current_contact) unless current_contact == nil
        next

      when "M"
        add_addresses(current_contact) unless current_contact == nil
        next
      else
        prompt("Misunderstood. Enter to continue")
        next
      end

    when "-"
      case user_cmd[-1]
      when "P"
        phone_to_remove = select_phone_number(current_contact, "Delete Phone Number for #{current_contact.name}") unless current_contact == nil
        current_contact.phone_numbers.delete(phone_to_remove)
        next

      when "E"
        email_to_remove = select_email_address(current_contact, "Delete Email for #{current_contact.name}") unless current_contact == nil
        current_contact.emails.delete(email_to_remove)
        next

      when "M"
        address_to_remove = select_mailing_address(current_contact, "Delete Address for #{current_contact.name}") unless current_contact == nil
        current_contact.addresses.delete(address_to_remove)
        next
      else
        prompt("Misunderstood. Enter to continue")
        next
      end
    else
      prompt("Misunderstood. Enter to continue")
      next
    end # case user_cmd[0]
  end # while loop
end

menu_loop
