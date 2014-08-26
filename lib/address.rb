class Address
  attr_accessor(:street, :city, :zip, :address)

  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
    @address = "#{street} #{city} #{state} #{zip}"
  end
end
