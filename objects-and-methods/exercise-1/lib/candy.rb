class Candy
  attr_reader :type
  attr_accessor :sugar
  def initialize(type, sugar = 100)
    @type = type
    @sugar = sugar
  end
end
