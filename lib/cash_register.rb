class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @items = []
    @discount = discount
    @last_transaction = []
  end

  def apply_discount
    @total = @total*(1.00-@discount/100.00)
    @total = @total.to_int
    if @discount == 0
      return "There is no discount to apply."
    else
      return "After the discount, the total comes to $#{@total}."
  end
  end

  def add_item(title,price,quantity=1)
    quantity.times {
    @items << title
    @total += price
    @last_transaction = [title, price]
  }
  end

  def void_last_transaction
    @total -= @last_transaction[1]
  end



end
