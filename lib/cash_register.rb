class CashRegister
  attr_accessor :total, :discount, :items, :last_item_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    self.total += ( price * quantity )
    self.items.concat([item] * quantity)
    self.last_item_price = price * quantity
  end

  def apply_discount
    if @discount > 0
      self.total -= ( @total * @discount/100 )
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_price
  end
end
