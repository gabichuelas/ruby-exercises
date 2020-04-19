class Beers
  def initialize
    @quantity = 99
  end

  def inventory
    @quantity
  end

  def take_one_down_and_pass_it_around
    @quantity -= 1
  end

  def restock
    @quantity += 99 - @quantity
  end 

end
