require 'account'
require 'date'

RSpec.describe Account do
  let(:mockPrinter) { double :printer, string_converter: nil }

  describe('Initialize') do
    it('should initialize with a balance of 0') do
      new_acc = Account.new
      expect(new_acc.balance).to eq(0)
    end
  end
  describe('Balance methods') do
    it('should be able to update balance after a withdrawal') do
      new_acc = Account.new
      new_acc.withdraw(50)
      expect(new_acc.balance).to eq(-50)
    end
    it('should be able to update balance after a deposit') do
      new_acc = Account.new
      new_acc.deposit(50)
      expect(new_acc.balance).to eq(50)
    end
  end
  # describe('transaction statment') do
  #   it('should have a record of the last transaction') do
  #     new_acc = Account.new
  #     new_acc.deposit(50)
  #     expect(new_acc.transaction_statement).to eq(
  #       [Time.now.strftime('%d-%m-%Y'), '50.00', nil, '50.00']
  #     )
  #   end
  # end
  describe('history_maker') do
    it('should have a record of previous transactions') do
      acc = Account.new
      allow(Time).to receive(:now).and_return("time")
      acc.deposit(50)
      acc.deposit(40)
      expect(acc.history)
        .to eq([
                 ["time", '40.00', nil, '90.00'],
                 ["time", '50.00', nil, '50.00']
               ])
    end
  end
  describe('statement') do
    it('should convert the account history into a statement form') do
      acc = Account.new(0, [], mockPrinter)
      allow(Time).to receive(:now).and_return("time")
      acc.deposit(50)
      acc.deposit(40)
      acc.deposit(50)
      acc.statement
      data = [["time", "50.00", nil, "140.00"],
              ["time", "40.00", nil, "90.00"],
              ["time", "50.00", nil, "50.00"]]
      expect(mockPrinter).to have_received(:string_converter).with(data)
    end
  end
end
