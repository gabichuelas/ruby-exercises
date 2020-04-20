require './nesting'
require 'minitest/autorun'
require 'minitest/pride'


# The intent of this exercise is to practice working with nested collections.
# Some tests will be able to pass without any enumeration, and others will require
# more complex iteration over multiple portions of the nested collection.

# All tests can be completed without using any enumerable other than #each.
# My suggestion would be to complete all tests using only #each, and then
# to go back over each test and refactor it using a different enumerable.

# The collection you're going to be using lives in ./nesting.rb and is called stores.
# If you spot an error or want to make this exercise better, please let us know!

class NestedTest < MiniTest::Test

  def test_list_of_olive_garden_employess
    # skip
    #^^^ Un-Skip each test
    #=======================
    # EXAMPLE
    employees = stores[:olive_garden][:employees]
    #=======================
    assert_equal ["Jeff", "Zach", "Samantha"], employees
  end

  def test_pancake_ingredients
    # skip
    #=======================
    pancake_ingredients = stores[:dennys][:dishes].first[:ingredients]
    #=======================
    assert_equal ["Flour", "Eggs", "Milk", "Syrup"], pancake_ingredients
  end

  def test_rissotto_price
    # skip
    #=======================
    risotto_price = stores[:olive_garden][:dishes][0][:price]
    #=======================
    assert_equal 12, risotto_price
  end

  def test_big_mac_ingredients
    # skip
    #=======================
    big_mac_ingredients = stores[:macdonalds][:dishes][0][:ingredients]
    #=======================
    assert_equal ['Bun','Hamburger','Ketchup','pickles'], big_mac_ingredients
  end

  def test_list_of_restaurants
    # skip
    #=======================
    store_names = stores.keys
    #=======================
    assert_equal [:olive_garden, :dennys, :macdonalds], store_names
  end

  def test_list_of_dishes_names_for_olive_garden
    # skip
    #=======================
    dishes_names = stores[:olive_garden][:dishes].map { |dish|
      # we were able to use one variable bc
      # the enumerator is working on an array,
      # unlike the following test.
      dish[:name]}
    #=======================
    assert_equal ['Risotto', 'Steak'], dishes_names
  end

  def test_list_of_employees_across_all_restaurants
    # skip
    #=======================
    # is there a cleaner way to write the following?
    # employee_names = (
    #   stores[:olive_garden][:employees] + stores[:dennys][:employees] + stores[:macdonalds][:employees]
    # ).flatten

    employee_names =
    # here we will use two variables k,v
    # bc we are iterating over a hash instead
    # of an array.
    stores.map { |k,v|
      v[:employees]
    }.flatten
    #=======================
    assert_equal ["Jeff","Zach","Samantha","Bob","Sue","James","Alvin","Simon","Theodore"], employee_names
  end

  def test_list_of_all_ingredients_across_all_restaurants
    # skip
    #=======================
    ingredients =
    stores.map { |k,v|
      v[:dishes].map { |dish|
        dish[:ingredients]}
      }.flatten
    #=======================
    assert_equal ["Rice",
                  "Cheese",
                  "Butter",
                  "Beef",
                  "Garlic",
                  "Flour",
                  "Eggs",
                  "Milk",
                  "Syrup",
                  "Flour",
                  "Eggs",
                  "Syrup",
                  "Bun",
                  "Hamburger",
                  "Ketchup",
                  "pickles",
                  "Potatoes",
                  "Salt"], ingredients
  end

  def test_full_menu_price_for_olive_garden
    # skip
    #=======================
    # full_menu_price =
    # stores[:olive_garden][:dishes].map { |dish|
    #   dish[:price]
    # }.reduce(:+)
    #REFACTOR:
    full_menu_price =
    stores[:olive_garden][:dishes].reduce(0) {
      |sum, dish| sum += dish[:price] }

    #=======================
    assert_equal 27, full_menu_price
  end

  def test_full_menu_for_olive_garden
    # skip
    #=======================
    olive_garden_menu = {}
    stores[:olive_garden][:dishes].each {
      |dish| olive_garden_menu[dish[:name]] = dish
    }

    #=======================
    expected = ({"Risotto"=>{:name=>"Risotto", :ingredients=>["Rice", "Cheese", "Butter"], :price=>12},
                  "Steak"=>{:name=>"Steak", :ingredients=>["Beef", "Garlic"], :price=>15}})
    assert_equal expected, olive_garden_menu
  end

  def test_menu_accross_all_restaurants
     # skip
    #=======================
    # FIRST TRY

    # olive_garden_menu = {}
    # stores[:olive_garden][:dishes].each {
    #   |dish| olive_garden_menu[dish[:name]] = dish
    # }
    #
    # dennys_menu = {}
    # stores[:dennys][:dishes].each {
    #   |dish| olive_garden_menu[dish[:name]] = dish
    # }
    #
    # macdonalds_menu = {}
    # stores[:macdonalds][:dishes].each {
    #   |dish| olive_garden_menu[dish[:name]] = dish
    # }
    #
    # full_menu = (olive_garden_menu.merge(dennys_menu)).merge(macdonalds_menu)

    # REFACTOR_1
    # full_menu = {}
    # stores.keys.each { |store|
    #   stores[store][:dishes].each {
    #     |dish| full_menu[dish[:name]] = dish
    #   }
    # }

    # REFACTOR_2 (uses each for hash instead of
    # turning it into an Array first with .keys )
    # full_menu = {}
    # stores.each { |store, data|
    #   data[:dishes].each {
    #     |dish| full_menu[dish[:name]] = dish
    #   }
    # }

    # REFACTOR_3

    full_menu =
    stores.reduce({}) { |results, store_w_data|
      (store_w_data[1][:dishes]).each {
        |dish| results[dish[:name]] = dish
      }
      results
    }

    #=======================
    expected = ({"Risotto"=>
                      {:name=>"Risotto", :ingredients=>["Rice", "Cheese", "Butter"], :price=>12},
                "Steak"=>
                    {:name=>"Steak", :ingredients=>["Beef", "Garlic"], :price=>15},
                "Pancakes"=>
                     {:name=>"Pancakes",
                      :ingredients=>["Flour", "Eggs", "Milk", "Syrup"],
                      :price=>10},
                "Waffles"=>
                      {:name=>"Waffles", :ingredients=>["Flour", "Eggs", "Syrup"], :price=>7},
                "Big Mac"=>
                    {:name=>"Big Mac",
                    :ingredients=>["Bun", "Hamburger", "Ketchup", "pickles"],
                    :price=>5},
                "Fries"=>
                    {:name=>"Fries", :ingredients=>["Potatoes", "Salt"], :price=>2}
                  })
    assert_equal expected, full_menu
  end

end
