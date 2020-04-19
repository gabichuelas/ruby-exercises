class TrickOrTreater

  def initialize(costume_instance)
    @costume_instance = costume_instance
  end

  def dressed_up_as
    @costume_instance.style
  end
end
