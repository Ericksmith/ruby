class Human
  attr_accessor :strength, :intelligence, :health, :stealth
  def initialize
    @strength = 3
    @intelligence = 3
    @stealth = 3
    @health = 100
  end
  def attack(obj)
    # check if the attacked object's class is Human or inherits from the Human class
    if obj.class.ancestors.include?(Human)
      obj.health -= 10
      # remember that we don't need to write "return" in ruby
      # stating true below will automatically return the boolean true
      true
    else
      false
    end
  end
end

class Wizard < Human
  def initialize
    super
    @health = 50
    @intelligence = 25
  end

  def heal
    @health += 10
    self
  end

  def fireball(victim)
    victim.health -= 20
    self
  end
end

class Ninja < Human
  def initialize
    super
    @stealth = 175
  end
  
  def steal(victim)
    victim.health -= 10
    @health += 10
    self
  end

  def get_away
    @health -= 15
    self
  end
end

class Samurai < Human
  @@num_of_samurai = 0
  def initialize
    super
    @health = 200
    @@num_of_samurai += 1
  end

  def death_blow(victim)
    victim.health = 0
    self
  end

  def meditate
    @health = 200
    self
  end

  def how_many
    puts get_Samurai_num
    self
  end

  private
    def get_Samurai_num
      return @@num_of_samurai
    end
end


s1 = Samurai.new
s2 = Samurai.new
n1 = Ninja.new
s1.health
s1.how_many
s1.death_blow(s2)
puts s2.health
n1.steal(s1)
puts n1.health
puts s1.health