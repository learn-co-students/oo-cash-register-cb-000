require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_trans, :last_void

  def initialize(d = 0)
    @total = 0
    @discount = d
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    if quantity > 1
      quantity.times do
        @items << title
      end
    else
      @items << title
    end
    @last_trans = {}
    @last_trans.store(title, price)
  end

  def apply_discount
    if @discount > 0
      @total *= (1 - (@discount.to_f / 100))
      @total = @total.to_i
      "After the discount, the total comes to $#{@total}."
    else
      'There is no discount to apply.'
    end
  end

  def void_last_transaction
    @total -= last_trans.values[0]
    @last_void = @items.pop
    @last_trans = {}
  end

end
