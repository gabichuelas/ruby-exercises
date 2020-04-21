# require_relative 'candy'

class Bag
  # is there a way to specify
  # what type (class) a defined
  # class is?
  # aka. class Bag is an array?
  attr_accessor :count, :candies, :size
  def initialize
    @count = 0
    @candies = []
  end

  def empty?
    if @count <= 0
      true
    else
      false
    end
  end

  def <<(candy)
    @candies << candy
    @count += 1
  end

  def contains?(type)
    if @candies.any? { |x| x.type == type }
      true
    else
      false
    end

  end

  def grab(type)
    # the count part goes first bc
    # method returns last piece of
    # code in the definition.
    @count -= 1
    # finds which candy to grab
    @candies.find { |candy|
      candy.type == type
    }
  end

  def take(n)
    @count -= n
    # needs to return an array
    # so we can use #size on it.
    @candies.sample(n)
  end


end
