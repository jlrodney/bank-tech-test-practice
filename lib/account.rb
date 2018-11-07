require_relative 'printer.rb'
require 'date'

# Class calculates the balance and handles the withdraw and deposit requests
class Account
  attr_reader :history
  def initialize(balance = 0.00, history = [], printer = Printer.new)
    @balance = balance
    @history = history
    @printer = printer
  end

  def deposit(amount = 0)
    @balance += amount
    history_maker(amount, nil)
  end

  def withdraw(amount = 0)
    @balance -= amount
    history_maker(nil, amount)
  end

  def statement
    puts @printer.string_converter(@history)
  end

  private

  def transaction_statement(credit, debit)
    [Time.now, credit, debit, @balance]
  end

  def history_maker(credit, debit)
    @history = [transaction_statement(credit, debit)] + @history
  end
end
