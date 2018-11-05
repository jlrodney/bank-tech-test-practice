require_relative 'account'
require_relative 'user'

# Class converts the account history into a nice balance statement
class Printer
  attr_reader :balance_statement

  def initialize(statement = HEADER)
    @balance_statement = statement
  end

  HEADER = 'date || credit || debit || balance'.freeze

  def string_converter(array)
    (0...array.length).each do |i|
      @balance_statement += "\n" + stringify(array[i])
      i += 1
    end
    @balance_statement
  end

  def stringify(array)
    @statement = ''
    (0..3).each do |i|
      @statement += array[i].to_s + ' || '
      i += 1
    end
    @statement = @statement[0...-3]
    @statement
  end
end
