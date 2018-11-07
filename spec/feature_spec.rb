require 'account'

RSpec.describe do
  describe 'the bank statement app' do
    it 'includes all functionality' do
      new_acc = Account.new
      new_acc.deposit(40)
      new_acc.withdraw(30)
      new_acc.deposit(70)
      acc_statement =
        "date || credit || debit || balance\n"\
        "#{Time.now.strftime('%d/%m/%Y')} || 70.00 ||  || 80.00 \n"\
        "#{Time.now.strftime('%d/%m/%Y')} ||  || 30.00 || 10.00 \n"\
        "#{Time.now.strftime('%d/%m/%Y')} || 40.00 ||  || 40.00 \n"
      expect { new_acc.statement }.to output(acc_statement).to_stdout
    end
  end
end
