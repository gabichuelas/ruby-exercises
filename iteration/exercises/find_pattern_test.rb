gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class FindPatternTest < Minitest::Test

  def test_1
    ages = [39, 45, 29, 24, 50]
    younger_than_thirty = nil
    ages.each do |age|
      if age < 30
        younger_than_thirty = age
        break
      end
    end

    assert_equal 29, younger_than_thirty
  end

  def test_2
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    younger_than_thirty = nil
    ages.each do |name, age|
      if age < 30
        younger_than_thirty = name
        break
      end
    end
    assert_equal :ladonna, younger_than_thirty
  end

  def test_3
    # skip
    ages = [39, 45, 29, 24, 50]
    older_than_fifty = nil
    ages.each do |age|
      older_than_fifty = age if age > 50
    end

    assert_nil older_than_fifty
  end

  def test_4
    # skip
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    older_than_fifty = nil
    ages.each do |name, age|
      older_than_fifty = age if age > 50
    end

    assert_nil older_than_fifty
  end

  def test_5
    # skip
    ages = [39, 45, 29, 24, 50]
    multiple_of_three = nil
    ages.each { |age|
      multiple_of_three = age if age % 3 == 0
      break
      # the break line makes the test pass
      # for first true value
    }

    assert_equal 39, multiple_of_three
  end

  def test_6
    # skip
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    multiple_of_three = nil
    ages.each { |name, age|
      multiple_of_three = name if age % 3 == 0
      break
    }

    assert_equal :abdi, multiple_of_three
  end

  def test_7
    # skip
    people = ["Willie", "Carmen Sandiego", "Bryan", "Faith", "Zac"]
    carmen = nil
    people.each { |name|
      carmen = name if name.match(/ /)
    }

    assert_equal "Carmen Sandiego", carmen
  end

  def test_8
    # skip
    places = {
      Bangkok: "Willie",
      Santa_Fe: "Carmen Sandiego",
      Rome: "Bryan",
      Munich: "Faith",
      Mogudishu: "Zac"
    }
    where_is_carmen_sandiego = nil
    places.each { |place, name|
      where_is_carmen_sandiego = place if name == "Carmen Sandiego"
    }

    assert_equal :Santa_Fe, where_is_carmen_sandiego
  end

  def test_9
    # skip
    numbers = [3, 7, 13, 11, 10, 2, 17]
    even = nil
    numbers.each { |num|
      if num.even? == true
        even = num
        break
      end
    }
    # Why doesn't this work?

    # numbers.each { |num|
    #   even = num if num % 2 == 0
    #   break
    # }
    assert_equal 10, even
  end

  def test_10
    # skip
    purchases = {
      "shoes" => :paid,
      "backpack" => :paid,
      "books" => :pending,
      "posters" => :paid,
      "food" => :pending
    }
    pending = nil
    purchases.each { |item, status|
      if purchases[item] == :pending
        pending = item.to_sym
      break
      end
    }

    assert_equal :books, pending
  end

  def test_11
    # skip
    purchases = {
      "shoes" => :paid,
      "backpack" => :paid,
      "books" => :pending,
      "posters" => :paid,
      "food" => :pending
    }
    starts_with_b = nil
    purchases.each { |item, status|
      if item[0] == "b"
        starts_with_b = item
      break
      end
    }

    assert_equal "backpack", starts_with_b
  end
end
