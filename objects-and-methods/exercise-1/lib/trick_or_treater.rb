require_relative 'bag'
require_relative 'candy'

class TrickOrTreater
  attr_reader :bag, :costume
  attr_accessor :sugar_level
  def initialize(costume)
    # this only works to reference the
    # costume class created in 'trick_or_treater.rb'
    # if it uses the variable costume.
    # what if there's another costume
    # called 'costume2' ?
    @costume = costume
    @bag = Bag.new
    @sugar_level = 0
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
    @sugar_level +=
    # Choose the last Candy obj
    # in @candies array; once eaten, it's deleted, and its
    # @sugar added to @sugar_level.
      bag.candies.pop.sugar
  end


end


# gaby = TrickOrTreater.new("alien")
# p gaby.bag.empty?
