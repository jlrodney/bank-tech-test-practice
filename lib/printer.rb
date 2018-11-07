# Class converts the account history into a nice balance statement
class Printer
  def initialize(head = HEADER)
    @balance_statement = head
  end

  HEADER = 'date || credit || debit || balance'.freeze

  def string_converter(array)
    (0...array.length).each do |i|
      @balance_statement += "\n" + stringify(array[i])
    end
    @balance_statement
  end

  private

  def stringify(array)
    array[0] = array[0].strftime('%d/%m/%Y')
    array[1] = format('%0.2f', array[1]) unless array[1].nil?
    array[2] = format('%0.2f', array[2]) unless array[2].nil?
    array[3] = format('%0.2f', array[3])
    formatter(array)
  end

  def formatter(array)
    "#{array[0]} || #{array[1]} || #{array[2]} || #{array[3]} "
  end
end
