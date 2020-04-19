class LeatherChair
  def initialize
    @fade = false
  end

  def faded?
    @fade
  end

  def expose_to_sunlight
    @fade = true
  end
end
