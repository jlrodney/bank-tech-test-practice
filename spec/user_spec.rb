require 'user.rb'

describe('User') do
  it('should be initialised with a name') do
    jr = User.new("Jamie")
    expect(jr.name).to eq("Jamie")
  end

  it('should be initialised with 0 balance') do
    jr = User.new("Jamie")
    expect(jr.balance).to eq(0)
  end 
end
