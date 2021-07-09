class CashRegister
  attr_accessor :total, :discount, :items



  def initialize(discount = nil)
    @total = 0
    @items = []
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    i = 0
    while i < quantity
      @items << title
      i += 1
    end
  end

  def apply_discount
    if @discount
      percentage = @discount / 100.00
      discounted_amount = @total * percentage
      @total -= discounted_amount
      @total.to_i
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = 0
  end
end
