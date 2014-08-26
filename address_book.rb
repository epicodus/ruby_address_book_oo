require './lib/contact.rb'
require './lib/address.rb'
require './lib/email.rb'
require './lib/phone.rb'


def menu
  loop do
    puts "Press '1' to create contact."
    puts "Press '2' to show or edit contacts."
    puts "Press '4' to delete a contact."
    puts "Press '0' to exit program."
    main_choice = gets.chomp
    exit if main_choice = 'q'
    menu_selector(main_choice)
  end
end

def menu_selector(choice)
  if choice == '1'
    puts 'What is the name of the contact?'
    name = gets.chomp
    new_contact = Contact.new(name)
    new_contact.save
  elsif choice == '2'
    puts "Here are all the available contacts: "
      if Contact.all.length == 0
        puts "Sorry, but you have no contacts"
        return
      end
    "#{index + 1}. #{contact.name} \n Phone: #{contact.list_phone} Email: #{contact.list_email} Address: #{contact.list_address}"
      modify_choice = gets.chomp.to_i
      unless   modify_choice == 'm'
        contact_edit(modify_choice)
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
  phone_choice = gets.chomp

  case phone_choice
  when 'a'

  when 'l'
    puts "Here is a list of phone numbers:"
  when 'e'
    edit_menu
end
menu






