class AppleTree
  attr_accessor :age
  attr_reader :height, :apple_count
  
  def initialize age
    @age = age
    @height = 10
    if @age < 4
      @apple_count = 0
    else
      @apple_count = @age * 2 - 6
    end
  end

  def year_gone_by
    @age += 1
    @height += (@height *0.1).to_i
    if @age > 3 && @age < 11
      @apple_count += 2
    end
    self
  end

  def pick_apples
    @apple_count = 0
  end

end