class CashRegister
  attr_accessor :total, :discount, :price, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(item, price, qty=1)
    @price = price
    price *= qty
    @total += price
    while qty > 0
      @prices << @price
      @items << item
      qty -= 1
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= (@price*@discount)/100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @prices[@prices.length-1]
  end

end
