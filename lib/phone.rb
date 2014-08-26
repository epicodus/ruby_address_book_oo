class Phone
  attr_accessor :phone_number, :code

  def initialize(code, phone_number)
    @phone_number = phone_number
    @code = code
  end

  def ==(phone)
    (phone.code == code && phone.phone_number == number)
  end

  def show
    "(#{area_code})#{number}"
  end
end
