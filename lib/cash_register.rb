class CashRegister
attr_accessor :total, :discount, :items

def initialize(discount = 0)
  #total is an instance variable and 0 by default. We won't initialize an instance with a value other than 0
  @total = 0
  @discount = discount
  @items = []
end

def add_item(title, price, quantity = 1)
@title = title
@quantity = quantity
@price = price
if (quantity > 0)
  @total += (price*quantity)
    quantity.times {@items << title}
  #endif
end
#end add_item definition
end

def apply_discount
if @discount > 0
  @disc_amount = (@price * @discount)/100
  @total -= @disc_amount
  return "After the discount, the total comes to $#{total}."
else
  return "There is no discount to apply."
end
end

def items
  @items
end

def void_last_transaction
  #@price will still hold the last value passed to it
  @total -= @price
end

end
