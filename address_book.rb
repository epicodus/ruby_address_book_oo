require './lib/contact.rb'

@current_contact

def menu
  puts 'Press 'q' to add a new contact.'
  puts 'Press 'w' to show contacts.'
  puts 'Press 'e' to delete a contact.'
  puts 'Press 'r' to edit a contact.'
  puts 'Press 't' to exit program'

  main_choice = gets.chomp

  case main_choice
  when 'q'
    puts 'What is the name of the contact?'
    new_name = gets.chomp
    Contact.new(new_name)
  puts "What are the phone numbers for #{new_name} ?"
  new_phone = gets.chomp.split(",")
  puts "What is the email address of #{new_name}?"
  new_email = gets.chomp.split(",")
  puts "What is the mailing address of #{new_name}?"
  new_mail = gets.chomp.split(",")
  new_contact = Contact.new(new_name)
  new_contact.add_numbers(new_phone)
  new_contact.add_emails(new_email)
  new_contact.add_addresses(new_mail)
  system 'clear'
  main_menu
end

def contact_edit
  system 'clear'
  Contact.all.each do |key,value|
    puts "#{key} \n"
  end
  puts 'which contact would you like to access?'
  inputted_contact = gets.chomp
  if Contact.all[inputted_contact]
    system 'clear'
    current_contact = Contact.all[inputted_contact]
    puts "#{current_contact.name} \n ---------- \n phone: #{current_contact.numbers} \n email: #{current_contact.emails} \n address: #{current_contact.addresses}"
    puts "\nwhat would you like to do?\n\n enter M to return to main menu\n enter P to alter phone numbers\n enter E to alter email addresses \n enter A to alter Mailing Addresses"
    user_types = gets.chomp.downcase
    if user_types == 'm'
      system 'clear'
      main_menu
    elsif user_types == 'p'
      current_contact.numbers.each_with_index do |element, index|
        puts "#{index}:  #{element}"
      end
      puts " enter A to add number \n enter D to delete number \n enter C to go back to contacts"
      contact_choice = gets.chomp.downcase
      if contact_choice == 'a'
        puts "What number would you like to add?"
        input_number = gets.chomp.downcase
        current_contact.numbers.push(input_number)
        contact_edit
      elsif contact_choice == 'd'
        puts "What number would you like to delete?"
        delete_number = gets.chomp.to_i
        current_contact.numbers.delete_at(delete_number)
        contact_edit
      end
    elsif user_types == 'e'
      current_contact.emails.each_with_index do |element, index|
        puts "#{index}:  #{element}"
      end
      puts " enter A to add email \n enter D to delete email \n enter C to go back to contacts"
      contact_choice = gets.chomp.downcase
      if contact_choice == 'a'
        puts "What email address would you like to add?"
        input_number = gets.chomp.downcase
        current_contact.emails.push(input_number)
        contact_edit
      elsif contact_choice == 'd'
        puts "What number would you like to delete?"
        delete_number = gets.chomp.to_i
        current_contact.emails.delete_at(delete_number)
        contact_edit
      end
    end
  else
    contact_edit
  end
end

def main_menu
  puts "\n"
  puts "******************CONTACT LIST********************\n"
  puts "\nwhat would you like to do?\n\n enter N to add new contact
  \n enter C to access contact list\n"
  main_choice = gets.chomp.downcase
  if main_choice == 'n'
    contact_menu
  elsif main_choice == 'c'
    contact_edit
  else
    system 'clear'
    main_menu
  end
end
main_menu


