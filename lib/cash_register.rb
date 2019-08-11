require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @last_transaction = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.last_transaction = price
    self.total += price * quantity
    i = 0
    until i >= quantity do
      self.items << title
      i += 1
    end
  end

  def apply_discount
    discount = self.total * (self.discount.to_f / 100)
    discounted_total = self.total -= discount.to_i
    discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{discounted_total}."
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
