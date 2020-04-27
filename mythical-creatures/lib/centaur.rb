class Centaur
  attr_accessor :name, :breed, :cranky, :standing, :arrow_count, :nap, :rested
  def initialize(name, breed )
    @name = name
    @breed = breed
    @cranky = false
    @standing = true
    @arrow_count = 0
    @rested = false

  end

  def shoot
    if cranky == false && arrow_count < 3 && standing == true
      @arrow_count += 1
      "Twang!!!"
    else
      "NO!"
    end

  end

  def run
    if cranky == false && arrow_count < 3 && standing == true
      @cranky = true
      "Clop clop clop clop!!!"
    else
      "NO!"
    end
  end

  def cranky?
    @cranky
  end

  def standing?
    @standing
  end

  def sleep
    if standing == false
      @cranky = false
    else
      "NO!"
    end
  end

  def lay_down
    @standing = false
  end

  def stand_up
    @standing = true
  end

  def laying?
    true if @standing == false
  end

  def drinks_potion
    if standing == true && rested == true
      "Centaur is sick!"
    else
      @rested = true
    end
  end
end
