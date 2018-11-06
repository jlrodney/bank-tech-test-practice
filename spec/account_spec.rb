require 'account'
require 'date'

RSpec.describe Account do
  let(:mockPrinter) { double :printer, string_converter: nil }

  before(:each) do
    allow(Time).to receive(:now).and_return('time')
  end

  describe('Balance methods') do
    it('should be able to update balance after a withdrawal') do
      acc = Account.new
      acc.deposit(323.56)
      expect(acc.withdraw(50.93)).to eq([
                                          ['time', nil, '50.93', '272.63'],
                                          ['time', '323.56', nil, '323.56']
                                        ])
    end
    it('should be able to update balance after a deposit') do
      new_acc = Account.new
      expect(new_acc.deposit(50)).to eq([['time', '50.00', nil, '50.00']])
    end
  end

  describe('statement') do
    it('should convert the account history into a statement form') do
      acc = Account.new(0, [], mockPrinter)
      acc.deposit(50)
      acc.deposit(40)
      acc.withdraw(50)
      acc.statement
      data = [['time', nil, '50.00', '40.00'],
              ['time', '40.00', nil, '90.00'],
              ['time', '50.00', nil, '50.00']]
      expect(mockPrinter).to have_received(:string_converter).with(data)
    end
  end
end
