class CashRegister
  attr_accessor :total, :discount, :last_transaction_total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_list = []
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @last_transaction_total = price * quantity
    quantity.times {@item_list << title}
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * (@discount / 100.0))
      "After the discount, the total comes to $#{@total.ceil}."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    @total -= @last_transaction_total
  end
end
