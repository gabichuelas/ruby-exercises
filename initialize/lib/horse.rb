class Horse
  attr_accessor :horse_name, :diet_arr
  def initialize(name)
    @horse_name = name
    @diet_arr = []
  end

  def name
    horse_name
  end

  def diet
    diet_arr
  end

  def add_to_diet(food)
    self.diet_arr << food
  end
end
