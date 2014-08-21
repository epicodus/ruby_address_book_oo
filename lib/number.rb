class Info
  def initialize (phone)
    @@numbers = phone
  end
  def phone
    @phone
  end
  def all
    @@numbers
  end
end

class Number < Info
end

class Email < Info
end

class Mail < Info
end
