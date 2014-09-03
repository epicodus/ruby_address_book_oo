require './lib/contact'
require './lib/address'
require './lib/phone'
require './lib/email'

  @current_person = nil

def main_menu

  puts "Press 'a' to add a new person. Press 'l' to list all contacts. Press 'x' to exit"
  input = gets.chomp

  if input == "x"
    exit
  elsif input == "a"
    puts "First Name"
    @first_name = gets.chomp
    puts  "Last Name"
    @last_name = gets.chomp
    @current_person = Contact.new(@first_name, @last_name)
    @current_person.save
    add_address
    add_email
    add_phone
  elsif input == "l"
    Contact.all.each do |person|
      puts person.first_name +  " " + person.last_name
    end
    puts "\n"
    puts "Choose a contact to view all details"
    @selected_contact = gets.chomp

    get_contact_details



  end


  main_menu
end

def add_address
  puts "Hello, '#{@first_name}', please add an address where we can reach you."
  puts "First, let's start with the address number."
  new_building = gets.chomp
  puts "What street do you live on?"
  new_street = gets.chomp
  puts "What city is it located in?"
  new_city = gets.chomp
  puts "What is the zip code?"
  new_zip = gets.chomp
  new_address = Address.new(new_building, new_street, new_city, new_zip)
  new_address.save
  @current_person.push_address(new_address)
end

def add_email
  puts "Enter the contacts e-mail address"
  email_input = gets.chomp
  new_email = Email.new(email_input)
  new_email.save
  @current_person.push_email(new_email)
end

def add_phone
  puts "Enter a phone number where we can contact you."
  phone_input = gets.chomp
  new_phone = Phone.new(phone_input)
  new_phone.save
  @current_person.push_phone(new_phone)
end

def get_contact_details
  Contact.all.each do |person|
    if @selected_contact == person.first_name + " " +  person.last_name
      puts "\n"
      puts person.first_name + " " + person.last_name
      person.addresses.each do |address|
        puts "1)" + address.building + " " + address.street + " " + address.city +
        " " + address.zip
      end
      person.emails.each do |email|
        puts "2)" + email.email
      end
      person.phone_numbers.each do |phone|
        puts "3)" + phone.phone_number
      end
      puts "If you would like to update contact details, press 1, 2 or 3"
      puts "Press 'm' to get back to the main menu"
      edit_choice = gets.chomp
      if edit_choice == "m"
        main_menu
      elsif edit_choice == "2"
        puts "Press 'e' to edit or 'a' to add a new email"
        email_update  =  gets.chomp
        if email_update == "e"
          puts "which e-mail would you like to edit"
          email_old = gets.chomp
          puts "what would you like to change it to?"
          email_new = gets.chomp

          person.emails.each do |email_from_array|
            if email_from_array.email == email_old
              email_from_array.update_email(email_new)
            end
          end
        elsif email_update == "a"
          add_email
        end
      elsif edit_choice == "3"
        puts "Press 'e' to edit or 'a' to add a new email"
        phone_update  =  gets.chomp
        if phone_update == "e"
          puts "which phone number would you like to edit"
          phone_old = gets.chomp
          puts "what would you like to change it to?"
          phone_new = gets.chomp
          person.phone_numbers.each do |phone_from_array|
            if phone_from_array.phone_number == phone_old
              phone_from_array.update_phone(phone_new)
            end
          end
        elsif phone_update == "a"
          add_phone
        end
      elsif edit_choice == "1"
        puts "Press 'a' to add a new address or 'd' to delete one."
        address_update = gets.chomp
        if address_update == 'a'
          add_address
        elsif address_update == 'd'
          count = 0
          @current_person.addresses.each do |address_array|
            puts count.to_s + ") " + address_array.full_address
            count += 1
          end
          puts "Press the number of the address you would like to delete."
          delete_address = gets.chomp
          @current_person.addresses.delete_at(delete_address.to_i)
        end
      end
    end
  end
end

main_menu
