class CashRegister
  attr_accessor :total, :discount, :newItem, :basket

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @basket = []
  end

  def add_item(item, price, quantity = 1)
    @newItem = price * quantity
    @total += @newItem
    quantity.times do
    @basket << item
  end
  end

  def apply_discount
    if @discount != 0
      @total -= @discount * 10
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @basket
  end

  def void_last_transaction
    @total -= @newItem
    @basket.pop
  end
end
