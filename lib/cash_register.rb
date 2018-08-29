
class CashRegister
  attr_reader :discount
  attr_accessor :total
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = 0
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times {@items << title}
    @last_item_price = price * quantity
  end

  def apply_discount
    if @discount > 0
      @total = @total - discount*10
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_item_price
  end
end
