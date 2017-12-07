require_relative 'bankaccount'
RSpec.describe BankAccount do
  before(:each) do
    @account1 = BankAccount.new()
  end

  it 'has a getter for checking attribute' do
    expect(@account1.checking_balance).to eq(100)
  end

  it 'has a getter for total balance attribute' do
    expect(@account1.get_total_balance).to eq(9101)
  end

  it 'raise error if withdrawing more than total in checking' do
    expect{@account1.withdraw_checking(400)}.to raise_error('Insufficent funds')
  end

  it 'interest rate should not have a setter' do
    expect{@account1.interest_rate=1000}.to raise_error(NoMethodError)
  end
end