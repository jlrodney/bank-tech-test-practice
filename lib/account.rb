require_relative 'account_history.rb'
require 'date'

class Account
  attr_reader :balance, :account_history

  def initialize(balance = 0, account_history = [])
    @balance = 0
    @account_history = account_history
  end

  def deposit(amount=0)
    @depost_amount = amount
    @balance += amount
    history_maker
  end

  def withdraw(amount=0)
    @withdraw_amount = amount
    @balance -= amount
    history_maker
  end

  def transaction_statement
    return [Time.now.strftime("%d-%m-%Y"), @withdraw_amount, @depost_amount, @balance]
  end

  def history_maker
    @account_history.push(transaction_statement)
  end



end
