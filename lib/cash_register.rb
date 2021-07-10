#Create cash register class
class CashRegister
  attr_accessor :total, :discount, :items, :last_txn

  def initialize(discount = nil)
    self.items = []
    self.total = 0
    self.discount = discount
  end

  def add_item(title, price, quantity = 1)
    quantity.times{self.items << title}
    added_amount = price * quantity
    self.last_txn = added_amount
    self.total += added_amount
  end

  def apply_discount
    if self.discount
      self.total = self.total * ((100 - self.discount) / 100.0)
      "After the discount, the total comes to $#{self.total.round}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_txn
  end
end
