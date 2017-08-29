require "pry"
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      self.items << title
    end
    @last_transaction_value = price * quantity
  end

  def apply_discount
    if @discount != 0
      @total = (@total - @total * (@discount.to_f / 100)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.total - @last_transaction_value
  end
end
