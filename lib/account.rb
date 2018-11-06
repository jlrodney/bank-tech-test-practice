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
    amount = format('%0.2f', amount) if amount != 0
    @deposit_amount = amount
    history_maker
  end

  def withdraw(amount = 0)
    @deposit_amount = nil
    @balance -= amount
    amount = format('%0.2f', amount) if amount != 0
    @withdraw_amount = amount
    history_maker
  end

  def transaction_statement
    [Time.now.strftime('%d-%m-%Y'), @deposit_amount, @withdraw_amount,
     format('%0.2f', @balance)]
  end

  def history_maker
    @history = [transaction_statement] + @history
  end

  def statement
    # @history.reverse
    stat = @printer.string_converter(@history)
    puts stat
  end
end
