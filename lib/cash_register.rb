class CashRegister
  attr_accessor :total, :discount, :items, :prices

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(item, price, quantity = 1)
    @total += price*quantity
    quantity.times {@items << item}
    quantity.times {@prices << price}
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * (@discount.to_f/100)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @prices[-1]
    @items.delete_at(-1)
  end
end
