class Groundhog
  attr_accessor :name_groundhog
  def initialize(name)
    @name_groundhog = name
  end

  def name
    self.name_groundhog
  end
  def name=(n)
    self.name_groundhog = n
  end
end
