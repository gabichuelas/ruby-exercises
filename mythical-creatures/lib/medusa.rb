# require_relative 'person'

class Medusa
  attr_accessor :name, :statues
  def initialize(name)
    @name = name
    @statues = []

  end

  def stare(victim)
    if @statues.count < 3
      @statues << victim
      victim.stoned = true
    elsif @statues.count == 3
      @statues << victim
      @statues.last.stoned = true
      @statues.first.stoned = false
      @statues.shift
      "Can't take more victims!"
    else
    end
  end
end

class Person
  attr_accessor :name, :stoned
  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    stoned

  end
end
