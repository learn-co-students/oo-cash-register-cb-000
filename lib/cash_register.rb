class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity > 1 ? self.total += (price * quantity) : self.total += price

    self.last_transaction = price * quantity

    while quantity > 0
      items.push(title)
      quantity -= 1
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = (total - (total * (discount/100.0))).to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = total - last_transaction
  end
end
