
class CashRegister
  attr_accessor :discount, :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    @last_item = [price, quantity]
    @total += price * quantity
    quantity.times do
      @items << item
    end
  end

  def self.items
    return @items
  end

  def apply_discount
    @total = @total * (100 - @discount)/100
      if @discount != 0
        return "After the discount, the total comes to $#{@total}."
      else
        return "There is no discount to apply."
      end
  end

  def void_last_transaction
    @last_item[1].times do
      @items.pop
      @total -= @last_item[0]
    end
  end

  def items
    return @items
  end

  def total
    @total
  end

end
