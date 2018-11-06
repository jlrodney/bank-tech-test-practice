require 'account'
require 'date'

RSpec.describe Account do
  let(:mockPrinter) { double :printer, string_converter: nil }

  # describe('Balance methods') do
  #   it('should be able to update balance after a withdrawal') do
  #     new_acc = Account.new
  #     new_acc.withdraw(50)
  #     expect(new_acc.balance).to eq(-50)
  #   end
  #   it('should be able to update balance after a deposit') do
  #     new_acc = Account.new
  #     new_acc.deposit(50)
  #     expect(new_acc.balance).to eq(50)
  #   end
  # end

  describe('statement') do
    it('should convert the account history into a statement form') do
      acc = Account.new(0, [], mockPrinter)
      allow(Time).to receive(:now).and_return('time')
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
