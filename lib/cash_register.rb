class CashRegister
  attr_accessor :items, :discount, :total, :last_transaction

  # sets an instance variable @total on initialization to zero
  # optionally takes an employee discount on initialization
  def initialize(discount=0)
    @total = 0 # start with a total of 0
    @discount = discount
    @items = [] # start with empty array
  end


  # returns the current total
  def total
    @total
  end


  # accepts a title and a price and increases the total
  # also accepts an optional quantity
  # doesn't forget about the previous total
  def add_item(item, price, quantity=1)
    # to call an instance method inside another instance method, use the self keyword to refer to the instance on which you are operating
    self.total += price * quantity # increment the total by the result of (price X quantity)
      # puts "total: #{self.total}"

    quantity.times do
      @items << item # add item to array 'quantity' # of times ***see note below
    end

    @last_transaction = price * quantity # keep track of the last transaction amount added
      # puts "last transaction: #{@last_transaction}"
  end


  # if the cash register was initialized with an employee discount
    # applies the discount to the total price
    # returns success message with updated total
    # reduces the total
  # if the cash register was not initialized with an employee discount
    # returns a string error message that there is no discount to apply
  def apply_discount
    if @discount != 0
      @discount = @discount.to_f / 100 # discount is 20%, so must convert to float before dividing by 100 to get percent
      self.total = (@total * (1 - @discount)).to_i # convert back to integer so result is $800 not $800.0
      "After the discount, the total comes to $#{self.total}."
        # puts @total
        # puts @discount.to_f / 100
        # puts 1 - (@discount.to_f / 100)
    else
      "There is no discount to apply."
    end
  end


  # returns an array containing all items that have been added
  def items
    @items
  end

  # subtracts the last transaction from the total
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end


=begin #add_item WHAT NOT TO DO (when adding item to items array)
  @items << item
    expected: ["eggs", "tomato", "tomato", "tomato"]
    got: ["eggs", "tomato"]

  @items << item * quantity
    expected: ["eggs", "tomato", "tomato", "tomato"]
    got: ["eggs", "tomatotomatotomato"]
=end
