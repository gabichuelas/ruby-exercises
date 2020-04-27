# require_relative 'person'

class Statues
  attr_accessor :count, :victims
  def initialize
    @count = 0
    @victims = []
  end

  def empty?
    if @count == 0
      true
    else
      false
    end
  end

  def << (victim)
    @victims << victim
    @count += 1
  end

  def first
    @victims[0]
  end

end
