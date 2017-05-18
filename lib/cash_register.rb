require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = nil
  end

  def add_item(title, price, quantity = 1)
    current_total = @total
    @total = current_total + (price * quantity)
    if quantity == 1
      @items << title
    else
      while quantity >= 1
          @items << title
          quantity = quantity - 1
      end
    end
    @last_item = (price * quantity)
  end

  def void_last_transaction
    @total = @total - @last_item
  end

  def items
    @items
  end

  def apply_discount
    current_total = @total
    if @discount != 0
      @total = current_total - (@discount * 10)
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

end
