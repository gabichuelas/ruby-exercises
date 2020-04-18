class Unicorn
  attr_accessor :name, :color
  def initialize(name, color = "white")
    @name = name
    @color = color
  end

  def white?
    # i used 'self' bc the variable was
    # already referenced in attr_accessor
    # but I noticed @color and color also
    # work. What's the convention?
    # > use the variable without @
    color == "white"
  end

  def say(phrase)
    "**;* #{phrase} **;*"
  end

end
