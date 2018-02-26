class CashRegister

  attr_accessor :total, :discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times { @cart << title }
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
  end

end
