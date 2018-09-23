require 'pry'

class CashRegister
  attr_accessor :total, :last_transaction_amount, :items, :discount

  def initialize(discount = 0)
    self.total = 0
    self.items = []
    self.discount = discount
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    self.last_transaction_amount = price * quantity
    quantity.times {self.items << title}
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total * ((100.0 - self.discount) / 100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction_amount
  end

end
