class Address

  @@all_addresses = []

  def Address.all
    @@all_addresses
  end

  def initialize(street, city, state, zipcode)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def street
    @street
  end

  def city
    @city
  end

  def zip
    @zip
  end

  def save
    @@all_addresses << self
  end

  def full_address
    @street + ", " + @city + ", " + @zip
  end

  def remove_address(address)
    @addresses.delete(address)
  end
end
