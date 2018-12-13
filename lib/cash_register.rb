class CashRegister
  attr_accessor :total, :discount, :items, :last_price
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  def add_item(title, price, quantity=1)
    @total += price * quantity
    @last_price = price * quantity
    times = 0
    while times < quantity do
      @items << title
      times += 1
    end
  end
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      math = @discount
      price1 = 100.0 - math
      price2 = price1 / 100.0
      @total = @total * price2
      @total = @total.to_i
      return "After the discount, the total comes to $#{total}."
    end
  end
  def items
    return @items
  end
  def void_last_transaction
    @total -= @last_price
    @items.pop
  end
end
