
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction
  attr_reader

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
  end



  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @last_transaction = price
    for i in 1..quantity
      @items << title
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total-@total*@discount/100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total = @total - @last_transaction
    @items.pop
  end

end
