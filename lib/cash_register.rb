class CashRegister

attr_accessor :total, :discount


def initialize(employee_discount = 0)
  @total = 0
  @discount = employee_discount
  @items = []
  @prices = []
end

def total
  @total
end

def add_item(title, price, quantity = 1)
  @total += price * quantity
  quantity.times do
    @items << title
    @prices << price
  end
end

def apply_discount
  if discount != 0
    self.total = (self.total - (self.total * (discount.to_f / 100))).to_i
    "After the discount, the total comes to $#{self.total}."
  else
    "There is no discount to apply."
  end
  end

def items
  @items
end

def void_last_transaction
  @total -= @prices.pop
  @items = @items.first @items.size - 1

end

end
