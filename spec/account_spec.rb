require 'account'

RSpec.describe Account do
  describe('Account') do

    it('should initialize with a balance of 0') do
      new_acc = Account.new
      expect(new_acc.balance).to eq(0)
    end

    it('should be able to update balance after a withdrawel') do
      new_acc = Account.new
      new_acc.withdraw(50)
      expect(new_acc.balance).to eq(-50)
    end

    it('should be able to update balance after a deposit') do
      new_acc = Account.new
      new_acc.deposit(50)
      expect(new_acc.balance).to eq(50)
    end

    it('should have a record of the last transaction') do
      new_acc = Account.new
      new_acc.deposit(50)
      expect(new_acc.transaction_statement).to eq(
        [Time.now.strftime("%d-%m-%Y"), nil, 50, 50]
      )
    end

    it('should have a record of previous transactions') do
      new_acc = Account.new
      new_acc.deposit(50)
      new_acc.deposit(40)
      expect(new_acc.account_history).to eq([
        [Time.now.strftime("%d-%m-%Y"), nil, 50, 50],
        [Time.now.strftime("%d-%m-%Y"), nil, 40, 90]
      ])
    end

  end
end
