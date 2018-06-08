# class CashRegister
#
#   attr_accessor :items, :discount, :total, :last_transaction
#
#   def initialize(discount=0)
#     @total = 0
#     @discount = discount
#     @items = []
#   end
#
#   def add_item(title, amount, quantity=1)
#     self.total += amount * quantity
#     quantity.times do
#       items << title
#     end
#     self.last_transaction = amount * quantity
#   end
#
#   def apply_discount
#     if discount != 0
#       self.total = (total * ((100.0 - discount.to_f)/100)).to_i
#       "After the discount, the total comes to $#{self.total}."
#     else
#       "There is no discount to apply."
#     end
#   end
#
#   def void_last_transaction
#     self.total = self.total - self.last_transaction
#   end
# end


class CashRegister
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end


  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times do
      self.items.push(title)
    end
    self.last_item = (price * quantity)
  end

  def apply_discount
    if discount != 0
    # self.total -= self.discount
    self.total = (total * ((100.0 - discount.to_f)/100)).to_i
    "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end




  def void_last_transaction
    self.total -= self.last_item

  end
end

# cash = CashRegister.new(20)
# cashh = CashRegister.new()
#
# purchases = {}
# purchases["tomatoes"] = 0
# purchases["cucumber"] = 2
#
# cash_register_with_discount = CashRegister.new(200)
#
# cash_register_with_discount.add_item("macbook air", 1000)
# cash.add_item("elektron analog four", 700)

# cash_register_with_discount.items
#
# cash_register_with_discount.apply_discount
# expect(cash_register_with_discount.total).to eq(800)
