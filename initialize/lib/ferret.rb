class Ferret

  def initialize
  end
  def give_name(name)
    @name = name
  end
  def name
    if @name
      "a ferret's name is #{@name}"
    else
      "a ferret has no name"
    end
  end


end
