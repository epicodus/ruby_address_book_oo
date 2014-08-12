require './lib/number'
class Contact
  @@names = []
  @@contacts = {}
  def Contact.names
    @@names
  end

  def Contact.clear
    @@names = []
    @@contacts = {}
  end

  def Contact.all
    @@contacts
  end

  def initialize (name)
    @name = name
    @@names << @name
    @@contacts[name] = self
  end

  def name
    @name
  end


