
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    self.last_transaction = price * quantity
    quantity.times { self.items << title }
  end

  def apply_discount
    return "There is no discount to apply." if self.discount.zero?
    "After the discount, the total comes to $#{(self.total *= 1 - (self.discount / 100.0)).to_i}."
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
