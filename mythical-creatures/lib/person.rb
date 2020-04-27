require_relative 'statues'
require_relative 'medusa'

class Person
  attr_reader :name, :look_in_here
  def initialize(name)
    @name = name

  end

  def stoned?
    #if self is in @statues, then
    # stoned? == true.
    
    # HOW TO REFERENCE Medusa > Statues > @victims ????
    if victims.any? { |victim|
      victim.name }
      true
    else
      false
    end
  end
end
