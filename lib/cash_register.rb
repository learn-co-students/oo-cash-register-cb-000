
class CashRegister
  attr_accessor :total, :discount, :order

  def initialize (discount=0)
    @total = 0
    @discount = discount
    @order = []
  end

def total
  @total
end

def add_item(title, price, quantity=1)
  self.total += price*quantity
  @order.fill(title, @order.size, quantity)
end

def apply_discount
  @total = @total - @discount*10
  if @discount != 0
    "After the discount, the total comes to $#{@total}."
  else
    "There is no discount to apply."
  end
end

def items
  return @order
end

def void_last_transaction
  @total = 0
end

end
