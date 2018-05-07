
class CashRegister
attr_accessor :total, :discount, :items, :last_txn

# Makes .new happen / sets total to 0 / optionally sets discount / makes items array
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
      quantity.times do
        items << item
    end
    self.last_txn = price * quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total -= self.discount * self.total / 100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_txn
  end

end
