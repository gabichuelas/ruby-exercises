gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pirate'

class PirateTest < Minitest::Test
  def test_has_name
    pirate = Pirate.new("Jack")
    assert_equal "Jack", pirate.name
  end

  def test_can_have_different_name
    # skip
    pirate = Pirate.new("Blackbeard")
    assert_equal "Blackbeard", pirate.name
  end

  def test_is_a_scallywag_by_default
    # skip
    pirate = Pirate.new("Jack")
    assert_equal 'Scallywag', pirate.job
  end

  def test_in_not_always_a_scallywag
    # skip
    pirate = Pirate.new("Jack", "Cook")
    assert_equal "Cook", pirate.job
  end

  def test_isnt_cursed_by_default
    # skip
    pirate = Pirate.new("Jack")
    refute pirate.cursed?
  end

  def test_becomes_cursed_after_enough_heinous_acts
    # skip
    pirate = Pirate.new("Jack")
    refute pirate.cursed?
    pirate.commit_heinous_act
    refute pirate.cursed?
    pirate.commit_heinous_act
    refute pirate.cursed?
    pirate.commit_heinous_act
    assert pirate.cursed?
  end

  def test_a_pirate_has_booty
    # skip
    pirate = Pirate.new("Jack")
    assert_equal 0, pirate.booty
  end

  def test_a_pirate_gets_100_booty_for_robbing_ships
    # skip
    pirate = Pirate.new("Jack")
    pirate.robs_ships(2)
    # assert pirate got 100 booty
    # for every ship robbed:
    
    # I can check for the specific
    # number of ships I specified,
    # but how to make this a more
    # algorithmic solution?
    assert_equal 100, (pirate.booty)/2
  end

end
