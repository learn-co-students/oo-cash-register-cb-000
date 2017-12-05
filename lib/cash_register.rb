class CashRegister
  attr_accessor :items, :discount, :total

  # sets an instance variable @total on initialization to zero
  # optionally takes an employee discount on initialization
  def initialize(discount=0)
    @total = 0
    @discount = discount
  end


  # returns the current total
  def total
  end


  # accepts a title and a price and increases the total
  # also accepts an optional quantity
  # doesn't forget about the previous total
  def add_item
  end


  # if the cash register was initialized with an employee discount
    # applies the discount to the total price
    # returns success message with updated total
    # reduces the total
  # if the cash register was not initialized with an employee discount
    # returns a string error message that there is no discount to apply
  def apply_discount
  end


  # returns an array containing all items that have been added
  def items
  end

  # subtracts the last transaction from the total
  def void_last_transaction
  end
end
