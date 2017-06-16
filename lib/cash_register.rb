class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    quantity > 1 ? self.total += (price * quantity) : self.total += price
  end
end
