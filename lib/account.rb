require_relative 'printer.rb'
require 'date'

# Class calculates the balance and handles the withdraw and deposit requests
class Account
  attr_reader :balance, :history

  def initialize(balance = 0.00, history = [], printer = Printer.new)
    @balance = balance
    @history = history
    @printer = printer
  end

  def deposit(amount = 0)
    @withdraw_amount = nil
    @balance += amount
    if amount != 0
      amount = format('%0.2f', amount)
    end
    @deposit_amount = amount
    history_maker
  end

  def withdraw(amount = 0)
    @deposit_amount = nil
    @balance -= amount
    if amount != 0
      amount = format('%0.2f', amount)
    end
    @withdraw_amount = amount
    history_maker
  end

  def transaction_statement
    [Time.now.strftime('%d-%m-%Y'), @deposit_amount, @withdraw_amount, format('%0.2f', @balance)]
  end

  def history_maker
    @history.push(transaction_statement)
  end

  def statement
    stat = @printer.string_converter(@history)
    puts stat
  end
end
