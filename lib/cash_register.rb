
class CashRegister
  attr_accessor :total, :discount, :items, :last_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity=1)
    @total +=  quantity * price
    quantity.times {@items << title}
    @last_price = price
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total *= (1 - @discount / 100.0)
      return "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    if @last_price == 0
      puts "Cannot void last transaction."
    else
      @total -= @last_price
      @items.pop
      @last_price = 0
    end
  end
end
