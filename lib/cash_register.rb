require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :previous_total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    @previous_total = @total
    @total += price * qty
    qty.times {@items << title}
  end

  def apply_discount
    @total -= @total * @discount.to_f / 100
    discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @previous_total
  end
end

item = CashRegister.new
item.add_item("eggs", 0.98)
