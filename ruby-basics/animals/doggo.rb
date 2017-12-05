require_relative "mammal"

class Dog < Mammal
  def initialize
    super
  end

  def pet
    @health += 5
    self
  end

  def walk
    @health -= 1
    self
  end

  def run
    @health -= 10
    self
  end

end


fidget = Dog.new
fidget.display_health
fidget.pet
fidget.display_health
fidget.walk.walk.walk.run.run.pet.display_health