class CashRegister

attr_accessor :total, :discount, :items, :previous_total

def initialize(discount = 0)
@total = 0
@discount = discount
@items = []
end

def add_item(title, price, quantity = 1)
  self.total += price * quantity
  quantity.times do
  items << title
  end
  self.previous_total = price * quantity
end

def apply_discount
if self.discount != 0
self.total -= (self.total/100) * self.discount.to_i
"After the discount, the total comes to $#{self.total}."
else
"There is no discount to apply."
end
end

def void_last_transaction
self.total -= self.previous_total
end


end
