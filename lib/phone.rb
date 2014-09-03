class Phone

  @@all_phones = []

  def Phone.all
    @@all_phones
  end

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number
  end

  def save
    @@all_phones << self
  end

  def update_phone(phone)
    @phone_number = phone
  end
end
