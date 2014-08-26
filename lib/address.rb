class Address
  attr_accessor :address, :city, :state, :zipcode

  def initialize(address, city, state, zipcode)
    @address = address
    @city = city
    @state = state
    @zipcode = zipcode
  end

  def ==(addres)
    (addres.address == address && addres.city == city && addres.state == state && addres.zipcode == zipcode)
  end

  def show
    "#{address}, #{city}, #{state}, #{zipcode}"
  end
end
