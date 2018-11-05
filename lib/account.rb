require 'date'

class Account
  attr_reader :balance

  def initialize(balance = 0)
    @balance = 0
  end

  def deposit(amount=0)
    @depost_amount = amount
    @balance += amount
  end

  def withdraw(amount=0)
    @withdraw_amount = amount
    @balance -= amount
  end

  def transaction_statement
    return [Time.now.strftime("%d-%m-%Y"), @withdraw_amount, @depost_amount, @balance]
  end



end
