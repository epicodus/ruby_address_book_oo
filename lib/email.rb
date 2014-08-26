class Email
  attr_accessor :eaddress

  def initialize(new_email)
    @email = new_email
  end

  def ==(email)
    email.eaddress == eaddress
  end
end
