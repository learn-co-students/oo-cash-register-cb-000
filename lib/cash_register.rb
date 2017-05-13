class CashRegister
  attr_accessor :items, :total, :discount, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      @items << item
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    if self.discount != 0
      @total -= @total * self.discount/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end

end
