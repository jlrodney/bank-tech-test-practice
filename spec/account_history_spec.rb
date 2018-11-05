require 'account_history'

describe Account_history do

  describe('Account_history') do
    it('should be initialized with an empty array') do
      acc_hist = Account_history.new
      expect(acc_hist.history).to eq([])
    end
  end

end
