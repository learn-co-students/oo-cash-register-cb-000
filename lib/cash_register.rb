class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    for i in 1..quantity do
      @items << title
    end
    @last_transaction = {:title => title, :price => price, :quantity => quantity}
  end
  def apply_discount
    if self.discount > 0
      self.total -= self.total * self.discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  def items
    @items
  end
  def void_last_transaction
      self.total -= @last_transaction[:price] * @last_transaction[:quantity]
      for i in 1..@last_transaction[:quantity] do
        @items.pop
      end
  end
end
