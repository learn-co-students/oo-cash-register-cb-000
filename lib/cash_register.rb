class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @last_item = [price, quantity]
    @total += price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    @total = @total * (100 - @discount)/100
    @discount != 0 ? "After the discount, the total comes to $#{@total}." : "There is no discount to apply."
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    @total -= @last_item[0]
  end
end
