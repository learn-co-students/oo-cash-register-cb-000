class CashRegister
 
  attr_accessor :total, :discount
  
 
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  #
 
  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times {@items << title }
    @last_transaction = [title,price,quantity]
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else  
     @total = (@total * ((100-discount)/100.to_f))
     "After the discount, the total comes to $#{@total.round}."
   end
  end

  def items
    @items 
  end  

  def void_last_transaction
    @total -= @last_transaction[1]*@last_transaction[2]
    
  end  
  
end