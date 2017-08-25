require 'pry'

class CashRegister
  attr_accessor :total, :discount, :previous_total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @previous_total = @total
    @total += price * quantity
    i = 0
    while i < quantity do
      @items << title
      i += 1
    end
  end

  def apply_discount
    if @discount != 0
      @total = (@total * (100 - @discount)/100).round
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @previous_total
  end
end
