class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, qty = 1)
    @total += price * qty
    @last_transaction = [item, price, qty]
    qty.times {|num| @items.push(item)}
  end
  
  def apply_discount
    if @discount != 0
      @total *= (1 - (@discount.to_f / 100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    price = @last_transaction[1]
    qty = @last_transaction[2]
    @total -= price * qty
  end
end
