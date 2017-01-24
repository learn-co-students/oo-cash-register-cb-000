class CashRegister
  attr_accessor :total


  def initialize(discount = 0)
    @total = 0
    @items = []
    @discount = discount
  end

  def discount
    @discount
  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    @last_price = price * quantity
    @total += @last_price
    @items.fill(item, @items.size, quantity)
  end

  def apply_discount
    if @discount > 0
      @total = @total * (1 - @discount/100.00)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_price
  end
end
