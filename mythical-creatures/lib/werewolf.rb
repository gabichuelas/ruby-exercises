require_relative '../test/werewolf_test'

class Werewolf
  attr_accessor :name, :location, :human, :wolf, :hungry, :victims
  def initialize(name, location = "")
    @name = name
    @location = location
    @human = true
    @wolf = false
    @hungry = false
    @victims = []
  end

  def human?
    @human
  end

  def change!
    if @human == true
      @human = false
      @wolf = true
      @hungry = true
    elsif @human == false
      @human = true
      @wolf = false
    else
    end

  end

  def wolf?
    @wolf
  end

  def consume_victim(victim)
    if @human == false
      @victims << victim
      @hungry = false
      victim.status = :dead
    else
      "No cannibalism!"
    end
  end
end
