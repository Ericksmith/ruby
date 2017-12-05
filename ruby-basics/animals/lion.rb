require_relative "mammal"

class Lion < Mammal
  def initialize
    super
    @health = 170
  end

  def fly
    @health -= 10
    self
  end

  def attack_town
    @health -= 50 
    self
  end

  def eat_human
    @health += 20
    self
  end
end

leo = Lion.new
leo.display_health
leo.attack_town.attack_town.attack_town.eat_human.eat_human.fly.fly.display_health


