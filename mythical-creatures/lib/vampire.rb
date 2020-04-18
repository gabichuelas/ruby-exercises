class Vampire
  attr_accessor :name, :pet
  def initialize(name, pet = "bat", thirsty = true)
    @name = name
    @pet = pet
    @thirsty = thirsty
  end

  def thirsty?
    @thirsty
  end

  def drink
    if @thirsty == true
      @thirsty = false
    else
    end
  end 
end

# the following also works
# class Vampire
#
#   def initialize(name, pet = "bat")
#     @name = name
#     @pet = pet
#   end
#
#   def name
#     @name
#   end
#
#   def pet
#     @pet
#   end
#
# end
