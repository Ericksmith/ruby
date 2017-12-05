class Human
  attr_reader :strength, :intelligent, :stealth, :health
  attr_writer :health
  def initialize st=3, int=3, stl=3
    @strength= st
    @intelligent=int
    @stealth=stl
    @health=100
  end

  def attack(victim)
    victim.health -= 10
    self
  end
end

h1 = Human.new
h2 = Human.new
# puts h1
# puts h1.strength
# puts h1.class.ancestors
puts h1.attack(h2)
puts h1.attack(h2)
puts h2.health
