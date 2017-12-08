require_relative 'apple_tree'
RSpec.describe AppleTree do
  before(:each) do
    @tree1 = AppleTree.new(1)
  end

  it 'has a getter and a setter for age' do
    @tree1.age = 2
    expect(@tree1.age).to eq(2)
  end
  
  it 'has a getter for heigh, no setter' do
    expect{@tree1.height = 10 }.to raise_error(NoMethodError)
  end

  it 'has a getter for apple count, no setter' do
    expect{@tree1.apple_count= 3}.to raise_error(NoMethodError)
  end

  it "Increasing age will increase the height by 10% and apple count by 2" do
    @tree1.year_gone_by.year_gone_by.year_gone_by
    expect(@tree1.height).to eq(13)
    expect(@tree1.apple_count).to eq(2)
  end
  it 'A tree should not grow apples for the first 3 years or after 10 years' do
    
    expect(@tree1.apple_count).to eq(0)
    @tree1.year_gone_by #2
    expect(@tree1.apple_count).to eq(0)
    @tree1.year_gone_by #3
    expect(@tree1.apple_count).to eq(0)
    @tree1.year_gone_by #4
    expect(@tree1.apple_count).to eq(2)
    @tree1.year_gone_by.year_gone_by.year_gone_by #7
    expect(@tree1.apple_count).to eq(8)
    @tree1.year_gone_by.year_gone_by.year_gone_by #10
    expect(@tree1.apple_count).to eq(14)
    for i in 10..50
      @tree1.year_gone_by
      expect(@tree1.apple_count).to eq(14)
    end
  end
  it 'Pick apples should remove all apples' do
    @tree1.year_gone_by.year_gone_by.year_gone_by
    @tree1.pick_apples
    expect(@tree1.apple_count).to eq(0)
  end

end