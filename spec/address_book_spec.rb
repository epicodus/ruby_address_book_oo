<<<<<<< HEAD
require 'contact.rb'
require 'number.rb'

=======
>>>>>>> 1136d05d80a3b105868455413604fde7ee9d5113
describe 'Contact' do
  before do
    Contact.clear
  end
  it 'initializes with a name parameter' do
    test_contact = Contact.new('Ronald McDonald')
    test_contact.should be_an_instance_of Contact
  end

  it 'lets you access the name of the contact' do
    test_contact = Contact.new('Ronald McDonald')
    test_contact.name.should eq 'Ronald McDonald'
  end

  it 'lets you add and access a phone number parameter' do
    test_contact = Contact.new('Ronald McDonald')
    test_contact.add_number('5031111111')
    test_contact.number.should eq '5031111111'
  end

  it 'lets you add and access an email address parameter' do
    test_contact = Contact.new('Ronald McDonald')
    test_contact.add_email('Ronald@McDonalds.com')
    test_contact.email.should eq 'Ronald@McDonalds.com'
  end

  it 'lets you add and access a mailing address parameter' do
    test_contact = Contact.new('Ronald McDonald')
    test_contact.add_mailing('101 McDonald Street')
    test_contact.mailing.should eq '101 McDonald Street'
  end

  it 'lets you enter and access multiple numbers' do
    test_contact =Contact.new('Ronald McDonald')
    test_contact.add_numbers(['1','2','3'])
    test_contact.numbers.should eq ['1','2','3']
  end

  it 'lets you enter and access multiple emails' do
    test_contact =Contact.new('Ronald McDonald')
    test_contact.add_emails(["a@a.com","b@b.com","c@c.com"])
    test_contact.emails.should eq ["a@a.com","b@b.com","c@c.com"]
  end

  it 'lets you enter and access multiple mailing addresses' do
    test_contact =Contact.new('Ronald McDonald')
    test_contact.add_addresses(['a','b','c'])
    test_contact.addresses.should eq ['a','b','c']
  end

  describe '.names' do
    it 'is empty at first' do
      Contact.names.should eq []
    end

    it 'automatically puts new names into class name list' do
      test_contact = Contact.new('Ronald McDonald')
      test_contact2 = Contact.new('Golden Arches')
      Contact.names.should eq ['Ronald McDonald', 'Golden Arches']
    end
  end

  describe '.all' do
    it 'is empty at first' do
      test_contact = Contact.new('Ronald McDonald')
      Contact.all['Ronald McDonald'].should be_an_instance_of Contact
    end
  end
end

describe 'Number' do
  it 'initializes with a number parameter' do
   test_number = Number.new(4024831968)
   test_number.should be_an_instance_of Number
 end
  it 'intiializes with multiple numbers' do
    test_number = Number.new(['13245555', '9806789798', '9204717'])
    test_number.all.should eq ['13245555','9806789798','9204717']
  end
end
