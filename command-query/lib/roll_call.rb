class RollCall
  attr_accessor :names
  def initialize
    @names = []
  end

  def longest_name
    # create an empty hash
    name_lengths = {}
    # for each name in @names array:
    # make each name a key with name.length
    # as the value & store in name_lengths hash
    @names.each { |name|
      name_lengths[name] = name.length }
    # return the key that corresponds to the
    # max number in the values array for
    # name_lengths hash 
    name_lengths.key(name_lengths.values.max)
  end

  def << name
    @names << name
  end
end
