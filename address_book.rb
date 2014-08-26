require './lib/contact.rb'

@current_contact

def menu
  puts "Press 'q' to add a new contact."
  puts "Press 'w' to show contacts."
  puts "Press 'e' to delete a contact."
  puts "Press 'r' to edit a contact."
  puts "Press 't' to exit program."

  main_choice = gets.chomp

  case main_choice
    when 'q'
      puts 'What is the name of the contact?'
      contact_name = gets.chomp
      Contact.new(contact_name)
      puts "the contact '#{contact_name}' has been added.\n"
      menu
    when 'w'
      list_contacts
      menu
    when 'e'
      list_contacts
      puts "Type the Name of contact you would like deleted:"
      contact_name = gets.chomp
      @current_contact = Contact.contact_search(contact_name)
      @current_contact.contact_delete
      puts "the contact '#{contact_name} has been deleted."
      menu
    when 'r'
      puts 'Type the name of the contact you wish to edit:'
      contact_name = gets.chomp
      @current_contact = Contact.contact_search(contact_name)
      edit_menu
    when 't'
      puts 'Good Bye'
      exit
    else
      puts 'Not available. Pick Again!'
      menu
  end
end

def list_contacts
  puts "Here is a list of Contacts\n"
  puts Contact.list_contacts
  puts "\n"
end

def edit_menu
  puts "Press 'y' to edit name"
  puts "Press 'u' to edit phone"
  puts "Press 'i' to edit email"
  puts "Press 'o' to edit address"
  puts "Press 'p' to exit program"
  puts "Press 'm' to go to the main menu"
  edit_choice = gets.chomp
  case edit_choice
    when 'n'
      puts "The current contact name is #{@current_contact.name}"
      puts "Please enter new name"
      new_name = gets.chomp
      @current_contact.edit_name(new_name)
      puts "Name changed to #{@current_contact.name}"
      edit_choice
    when 'p'
      phone_menu
    when 'e'
      email_menu
    when 'a'
      address_menu
    when 'm'
      main_menu
    when 'x'
      puts "So long."
      exit
    else
      puts "That's not an option!"
      edit_menu
  end
end

def phone_menu
  puts "#{The current contact name is @current_contact.name}"
  puts "Press 'a' to add phone number"
  puts "Press 'l' to list phone numbers"
  puts "Press 'e' to return to edit menu"
end
menu






