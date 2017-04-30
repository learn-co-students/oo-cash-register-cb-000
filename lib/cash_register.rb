class CashRegister
  attr_accessor :discount, :total, :items, :last_item

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, amount, quantity=1)
    self.total += amount * quantity
    quantity.times do
      @items << item
    end
    @last_item = amount * quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      @total -= @total * self.discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_item
  end
end
