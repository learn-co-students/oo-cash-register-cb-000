class CashRegister

attr_accessor :cash_register, :cash_register_with_discount, :total, :items, :cart

@@disc = []
@@total = []
@@items = []

def initialize(disc=nil)
  @cash_register_with_discount = disc
  @cash_register = cash_register
  @@disc << disc
  @total = 0
  self.items = []
  self.cart = []
end

def add_item(title, price, x=1)
    @total += (price*x)
    self.cart << price
    i = x
    until i == 0 do
      @items << title
      i -= 1
    end
end

def apply_discount
  if @cash_register_with_discount != nil
  price = @total
  percentage = @@disc.map(&:to_f).uniq[1] / 100#20.0
  disc_value = percentage * @total #200
  final_price = @total -= disc_value
  return "After the discount, the total comes to $#{final_price.to_i}."
else
  return "There is no discount to apply."
end
end

def total
@total
end

def items
@items
end

def discount
  @@disc[1]
end

def void_last_transaction
@total = @total - self.cart.pop
end

end
