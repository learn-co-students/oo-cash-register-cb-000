require 'pry'
# Cash Register <3
class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0.0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    @last_transaction = price * quantity
    @items.fill(item, @items.size, quantity)
  end

  def apply_discount
    if @discount > 0
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      'There is no discount to apply.'
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
