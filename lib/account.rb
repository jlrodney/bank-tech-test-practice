require_relative 'printer.rb'
require 'date'

# Class calculates the balance and handles the withdraw and deposit requests
class Account
  attr_reader :balance, :history

  def initialize(_balance = 0, history = [])
    @balance = 0
    @history = history
  end

  def deposit(amount = 0)
    @depost_amount = amount
    @balance += amount
    history_maker
  end

  def withdraw(amount = 0)
    @withdraw_amount = amount
    @balance -= amount
    history_maker
  end

  def transaction_statement
    [Time.now.strftime('%d-%m-%Y'), @withdraw_amount, @depost_amount, @balance]
  end

  def history_maker
    @history.push(transaction_statement)
  end
end
