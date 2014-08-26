class Address
  attr_accessor :address, :city, :state, :zipcode

  def initialize(address, city, state, zipcode)
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end

  def address
    @address
  end
end
