require 'pry'
class CashRegister
  attr_accessor :total, :discount, :last_item, :items


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      @items << title
    end
    @last_item = price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0
    self.total *= (100 - self.discount) * 0.01
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.total -= self.last_item
  end
end
