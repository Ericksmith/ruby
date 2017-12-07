class BankAccount
  attr_reader :account_number, :checking_balance
  @@num_of_accounts = 0
  @@interest_rate = 0.01

  def initialize
    @account_number = gen_account_num
    @checking_balance = 100
    @saving_balance = 9001
    @@num_of_accounts += 1
  end

  def get_checking_balance
    return @checking_balance
  end

  def get_saving_balance
    return @saving_balance
  end

  def deposit_saving num
    @saving_balance += num
    self
  end

  def deposit_checking num
    @checking_balance += num
    self
  end
  
  def withdraw_saving num
    if @saving_balance - num < 0
      return "Insufficient funds"
    end
    @saving_balance -= num
    self
  end

  def withdraw_checking num
    if @checking_balance - num < 0
      raise 'Insufficent funds'
    end
    @checking_balance -= num
    self
  end

  def get_total_balance
    @checking_balance + @saving_balance
  end

  def self.display_num_of_accounts
    puts @@num_of_accounts
    self
  end

  def self.getRate
    @@interest_rate
  end

  def account_information
    total = @saving_balance + @checking_balance
    puts "Account Number #{@account_number}"
    puts "Total money #{total}"
    puts "Checking Balance #{@checking_balance}"
    puts "Saving Balance #{@saving_balance}"
    rate = BankAccount.getRate
    puts "Interest Rate #{rate}"
    self
  end

  private
    def gen_account_num
      rand(10000)
    end





end