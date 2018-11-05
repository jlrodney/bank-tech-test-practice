require 'account'
describe Account do
  describe('Account') do
    it('should initialize with a balance of 0') do
      new_acc = Account.new
      expect(new_acc.balance).to eq(0)
    end
  end
end
