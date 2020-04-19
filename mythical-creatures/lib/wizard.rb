class Wizard
  attr_accessor :name, :bearded, :rested, :spells
  def initialize(name, bearded = true)
    @name = name
    @bearded = bearded
    @rested = true
    @spells = 0
  end

  def bearded?
    if bearded == true
      true
    else
      false
    end
  end

  def incantation(spell)
    "sudo " + spell
  end

  def rested?
    if spells >= 3
      @rested = false
    else
      @rested = true
    end 
  end

  def cast
    @spells += 1
    "MAGIC MISSILE!"
  end
end
