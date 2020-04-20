require_relative 'bag'

class TrickOrTreater
  attr_reader :bag, :costume
  def initialize(costume)
    # this only works to reference the
    # costume class created in 'trick_or_treater.rb'
    # if it uses the variable costume.
    # what if there's another costume
    # called 'costume2' ?
    @costume = costume
    @bag = Bag.new
  end

  def dressed_up_as
    @costume.style
  end

  def has_candy?
    if bag.count <= 0
      false
    else
      true
    end
  end

  def candy_count
    bag.count
  end

  def eat
    bag.count -= 1
  end
end


# gaby = TrickOrTreater.new("alien")
# p gaby.bag.empty?
