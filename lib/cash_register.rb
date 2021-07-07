class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    self.items.fill(title, items.size, quantity)
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount != nil
      @total -= @total * @discount/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
