class Pirate
  attr_accessor :name, :job, :acts, :booty, :ships
  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @acts = 0
    @booty = 0
    @ships = 0
  end

  def cursed?
    if @acts >= 3
      true
    else
      false
    end
  end

  def commit_heinous_act
    @acts += 1
  end

  def robs_ships(n)
    n.times do
      @booty += 100
    end
  end

end
