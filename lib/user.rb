class User

  attr_reader :name, :balance 


  def initialize(name, balance = 0)
    @name = name
    @balance = balance
  end

end
