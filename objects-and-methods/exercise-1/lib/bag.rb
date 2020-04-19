
class Bag
  # is there a way to specify
  # what type (class) a defined
  # class is?
  # aka. class Bag is an array?
  attr_accessor :count, :candies
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

end
