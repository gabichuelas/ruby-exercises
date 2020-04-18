class Dragon
  attr_accessor :name, :color, :rider, :hungry, :meal_count
  def initialize(name, color, rider)
    @name = name
    @color = color
    @rider = rider
    @hungry = true
    @meal_count = 0
  end

  def hungry?
    @hungry

  end

  def eat
    @meal_count += 1
    @hungry = false if meal_count == 3
  end
end
