class CashRegister
  attr_accessor :total, :previous_total, :items, :previous_item_quantity
  attr_reader :discount
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  def add_item(title, price, quantity = 1)
    quantity.times { |i| self.items << title }
    self.previous_item_quantity = quantity
    self.previous_total = self.total
    self.total += price * quantity
  end
  def apply_discount
    self.total = self.total * (1 - (self.discount/100.0))
    self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{total.to_i}."
  end
  def void_last_transaction
    self.total = self.previous_total
    self.previous_item_quantity.times {|i| self.items.pop()}
  end
end
