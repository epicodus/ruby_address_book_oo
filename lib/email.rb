class Email
  @@all_emails = []

  def Email.all
    @@all_emails
  end

  def initialize(email)
    @email = email
  end

  def email
    @email
  end

  def save
    @@all_emails << self
  end

  def update_email(email)
    @email = email
  end

end
