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
      new_name = gets.chomp
      Contact.new(new_name)
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
menu






