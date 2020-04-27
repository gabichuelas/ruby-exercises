class Ogre
  attr_accessor :name, :home, :swings, :encounter_counter
  def initialize(name, home = 'Swamp')
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end

  def encounter(human)
    @encounter_counter += 1
    # references the counter in human Class
    human.increment_encounters
    # also adds a swing if human
    # notices it:
    swing_at(human) if human.notices_ogre?

    end
  end

  def swing_at(human)
    # this method allows ogre to
    # swing regardless of whether
    # human notices it.
    @swings += 1
  end

  def apologize(human)
    human.reset_encounter_counter
    # @swings = 0
  end

end

class Human
  attr_accessor :name, :encounter_counter
  def initialize
    @name = 'Jane'
    @encounter_counter = 0

  end

  def increment_encounters
    @encounter_counter += 1
  end

  def notices_ogre?
    if encounter_counter % 3 == 0
      true
    else
      false
    end
  end

  def knocked_out?
    if encounter_counter % 6 == 0 && encounter_counter != 0
      true
    else
      false
    end
  end

  def reset_encounter_counter
    @encounter_counter = 0
  end

end
