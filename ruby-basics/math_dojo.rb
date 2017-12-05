class MathDojo
  def initialize
    @sum = 0
  end
  def add(val1, *vals)
    if val1.is_a?(Array)
      val1.each {|num| @sum += num}
    else
      @sum += val1
    end
    vals.each do |elem|
      if elem.length > 0
        elem.each {|num| @sum += num}
      end
    end
    self
  end
  def subtract(val1, *vals)
    if val1.is_a?(Array)
      val1.each {|num| @sum -= num}
    else
      @sum -= val1
    end
    vals.each do |elem|
      if elem.length > 0
        elem.each {|num| @sum -= num}
      end
    end
    self
  end
  def result
    puts @sum
  end
end

# a = MathDojo.new.subtract(2, 5)
# puts a
# challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15

