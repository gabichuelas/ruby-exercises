gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class SortByPatternTest < Minitest::Test

  def test_sort_alphabetically
    words = ["broccoli", "Carrots", "FISH", "Bacon", "candy"]
    # the following creates the temporary
    # array that would be created by #sort_by
    transformed = []
    words.each do |word|
      transformed << [word.downcase, word]
    end
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, word|
      sorted << word
    end
    assert_equal ["Bacon", "broccoli", "candy", "Carrots", "FISH"], sorted
  end

  def test_sort_alphabetically_by_last_letter
    things = ["pill", "box", "glass", "water", "sponge"]
    transformed = []
    things.each do |thing|
      transformed << [thing[-1], thing]
    end
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, thing|
      sorted << thing
    end
    assert_equal ["sponge", "pill", "water", "glass", "box"], sorted
  end

  def test_sort_by_distance
    # skip
    distances = ["1cm", "9cm", "30cm", "4cm", "2cm"]
    transformed = []
    distances.each { |distance|
      transformed << [distance.delete("cm").to_i, distance]
    }
    transformed = transformed.sort
    sorted = []
    transformed.each do |sort_key, distance|
      sorted << distance
    end
    assert_equal ["1cm", "2cm", "4cm", "9cm", "30cm"], sorted
  end

  def test_sort_by_length
    # skip
    words = ["heteromorph", "ancyloceratina", "bioengineering", "mathematical", "bug"]
    transformed = []
    words.each { |word|
      transformed << [ word.length, word]
    }
    transformed = transformed.sort
    sorted = []
    transformed.each { |word_length, word|
      sorted << word
    }
    assert_equal ["bug", "heteromorph", "mathematical", "ancyloceratina", "bioengineering"], sorted
  end

  def test_sort_by_proximity_to_ten
    # skip
    prices = [3.02, 9.91, 17.9, 10.01, 11.0]
    transformed = []
    prices.each { |num|
      transformed << [(10 - num).abs, num]}
    transformed = transformed.sort
    sorted = []
    transformed.each { |difference, num|
      sorted << num }
    assert_equal [10.01, 9.91, 11.0, 3.02, 17.9], sorted
  end

  def test_sort_by_number_of_cents
    # skip
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    transformed = []
    prices.each { |num|
      transformed << [ num - num.floor, num]
    }
    transformed = transformed.sort
    sorted = []
    transformed.each { |decimal, num|
      sorted << num }
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], sorted
  end

end
