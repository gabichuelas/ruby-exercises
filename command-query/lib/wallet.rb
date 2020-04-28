class Wallet
  attr_accessor :cents
  def initialize
    @cents = 0

    # this is the hash that maps
    # values to coin keys
    @coins = {penny: 1, nickel: 5, dime: 10, quarter: 25, dollar: 100}

  end

  def << coin
    # I didn't use shovel operator in method
    # definition because we don't want to know
    # how many coins are in the wallet,
    # we want to know what the total amount
    # of those coins is.

    # use the symbol passed in to access the
    # value in the key defined under initialize
    @cents += @coins[coin]
  end

  def take(*coins)
    coins.each { |coin|
      @cents -= @coins[coin] }
  end


end
