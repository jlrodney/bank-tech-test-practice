require 'account_history'

RSpec.describe AccountHistory do

  describe('Account_history') do
    it('should be initialized with an empty array') do
      acc_hist = AccountHistory.new
      expect(acc_hist.history).to eq([])
    end
  end


end
