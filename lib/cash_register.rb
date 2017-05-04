class CashRegister
  attr_accessor :total, :discount, :items, :title, :quantity, :last_transaction_amount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction_amount = price * quantity
    self.total += price * quantity
    quantity.times do
      items << title
    end

  end

  def apply_discount
    if @discount != nil
      self.total = self.total * (100-@discount)/100
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction_amount
  end
end
