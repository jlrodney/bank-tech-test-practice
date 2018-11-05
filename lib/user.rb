require_relative 'account'
class User

  attr_reader :name, :account


  def initialize(name, account = Account.new)
    @name = name
    @account = account
  end 


end
