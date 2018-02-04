require 'pry'

class CashRegister
  attr_accessor :total , :discount , :items , :transaction
  def initialize(x = 0)
    @total = 0
    @items = []
    @transaction = 0
    @discount = x
  end

  def add_item(x, i, y = 1)
    items_lenght = @items.length
    @items.fill(x , items_lenght , y)
    @transaction = i
    @total += i * y
    @total
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      x = @discount / 100.00
      i = @total * x
      @total -= i
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @transaction
  end
end
