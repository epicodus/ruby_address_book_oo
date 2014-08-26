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
    else
      Contact.all.each do |key,value|
        puts "#{key} \n"
      end
    end
      puts "\nEnter a contact number to modify or press 'm' to exit"
      modify_choice = gets.chomp.to_i
      unless   modify_choice == 'm'
        contact_editor(modify_choice)
      end
  elsif choice == '3'
    puts "Existing Contacts:"
    Contact.all.each_with_index { |contact, index| puts "#{index + 1}. #{contact.name}" }
    puts "\nContact to delete?"
    deleted_contact = gets.chomp.to_i
    Contact.all.delete_at(deleted_contact-1)
  else
    puts 'Not available. Pick Again!'
    menu
  end
end

def contact_editor(input)
 puts "\nYou're modifiying the contact: #{Contact.all[input - 1].name} \nEmail: #{Contact.all[input - 1].list_email} \nPhone: #{Contact.all[input - 1].phone_list} \nAddress: #{Contact.all[input - 1].address_list}"
  puts "\nPress '1' to add email"
  puts "Press '2' to add phone"
  puts "Press '3' to add address"
  puts "Press '4' to delete email"
  puts "Press '5' to delete phone"
  puts "Press '6' to delete address"
  puts "Press 'm' to return to main menu"
  edit_choice = gets.chomp.to_i
  unless (editing_choice == 'm')
    if edit_choice == 1
      puts "\nEmail address?"
      new_email = gets.chomp
      Contact.all[input-1].emails << Email.new(new_email)
      contact_editor(input)

    elsif edit_choice == 2
      puts "\nPhone?"
      new_phone = gets.chomp
      Contact.all[input-1].phones << Phone.new(new_phone)
      contact_editor(input)

    elsif edit_choice == 3
      puts "\nAddress?"
      new_address = gets.chomp
      Contact.all[input-1].addresses << Address.new(new_address)
      contact_editor(input)

    elsif edit_choice == 4
      puts "\nEmail address to delete?"
      Contact.all[input-1].emails.each_with_index { | email, index | puts "#{index + 1}. #{email.email}" }
      deleted_email = gets.chomp.to_i
      Contact.all[input-1].emails.delete_at(deleted_email-1)
      contact_editor(input)

    elsif edit_choice == 5
      puts "\nPhone to delete?"
      Contact.all[input-1].phones.each_with_index { | phone, index | puts "#{index + 1}. #{phone.phone}" }
      deleted_phone = gets.chomp.to_i
      Contact.all[input-1].phones.delete_at(deleted_phone-1)
      contact_editor(input)

    elsif edit_choice == 6
      puts "\nAddress to delete?"
      Contact.all[input-1].addresses.each_with_index { | address, index | puts "#{index + 1}. #{address.address}" }
      deleted_address = gets.chomp.to_i
      Contact.all[input-1].addresses.delete_at(deleted_address-1)
      contact_editor(input)
    end
  end
end
def list_contacts
  index = 0
  "#{index + 1}. #{Contact.name} \n Phone: #{@current_contact.list_phone} Email: #{Contact.email_list} Address: #{Contact.address_list}"
end

menu
