require 'printer'
require 'date'

RSpec.describe Printer do
  test_output = [
    [Time.now, nil, '50.00', '50.00'],
    [Time.now, nil, '40.00', '90.00'],
    [Time.now, nil, '50.00', '140.00']
  ]

  describe('Printer') do
    it('should convert the account history and convert it into a statement') do
      acc_hist = Printer.new
      expect(acc_hist.string_converter(test_output)).to eq(
        "date || credit || debit || balance\n"\
        "06/11/2018 ||  || 50.00 || 50.00 \n"\
        "06/11/2018 ||  || 40.00 || 90.00 \n"\
        '06/11/2018 ||  || 50.00 || 140.00 '
      )
    end
  end
end
