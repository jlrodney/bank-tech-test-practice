require 'printer'
require 'date'

RSpec.describe Printer do
  test_output = [
    [Time.now.strftime('%d-%m-%Y'), nil, "50.00", "50.00"],
    [Time.now.strftime('%d-%m-%Y'), nil, "40.00", "90.00"],
    [Time.now.strftime('%d-%m-%Y'), nil, "50.00", "140.00"]
  ]

  describe('Printer') do
    it('should be initialized with a balance statement') do
      acc_hist = Printer.new
      expect(acc_hist.balance_statement).to eq(
        'date || credit || debit || balance'
      )
    end

    it('string_converter') do
      acc_hist = Printer.new
      acc_hist.string_converter(test_output)
      expect(acc_hist.balance_statement).to eq(
        "date || credit || debit || balance\n05-11-2018 ||  || 50.00 || 50.00 \n05-11-2018 ||  || 40.00 || 90.00 \n05-11-2018 ||  || 50.00 || 140.00 "
      )
    end

end
end
