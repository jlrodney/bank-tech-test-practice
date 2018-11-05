require_relative 'account'

# Class is potentially useless
class User
  attr_reader :name, :account

  def initialize(name, account = Account.new)
    @name = name
    @account = account
  end
end
