require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount=0)
    @total = 0
    @last_transaction = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    if quantity != 1
      self.total += (price * quantity)
      self.last_transaction += (price * quantity)
      quantity.times do
        @items << item
      end
    else
      self.total += price
      self.last_transaction += price
      @items << item
    end
  end

  def apply_discount
    self.total -= (self.total * self.discount)/100
    if self.discount != 0
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
