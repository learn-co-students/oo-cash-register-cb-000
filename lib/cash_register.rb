class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @items << title
    end
    @total += price*quantity
    @last_transaction = price*quantity
  end

  def apply_discount
    if @discount != 0
      discount = @discount * 0.01
      @total = @total - @total * discount
      discount_msg = "After the discount, the total comes to $#{@total.to_i}."
    else
      discount_msg = "There is no discount to apply."
    end
    discount_msg
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
