class CashRegister
  
  attr_accessor :total, :discount, :items, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @total += (price * quantity)
    
    # @items << item if quantity = 1
    (1..quantity).to_a.each do |i|
      @items << item
    end
    
    @last_transaction = [item, price, quantity]
    
  end
  
  def apply_discount
    if(discount != 0)
      @total = ((@total) * ((100 - @discount.to_f) / 100)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_transaction[1]
  end
end
