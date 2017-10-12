

class CashRegister
  attr_accessor :total, :discount, :title, :price

  @@items = []
  @@last_tran = 0

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @@items = []
  end

  def add_item(title, price, quantity = 1)
    @title = title
    @@last_tran = price * quantity
    self.total += (price * quantity)
    @@items.fill(title, @@items.size, quantity)
    self.total
  end

  def apply_discount
    self.total -= self.discount
    x = []
    if self.discount > 0
      x << "After the discount, the total comes to $#{self.total}."
    else
      x << "There is no discount to apply."
    end
    return x[0]
  end

  def items
    @@items
  end

  def void_last_transaction
    self.total -= @@last_tran
    self.total
  end



  def self.total
    total
  end

  def self.discount
    discount
  end



end
