class CashRegister
 
  attr_accessor :total, :discount, :items
 
  def initialize(discount=0)
    @total  = 0;
    @discount = discount ;
    @items = [];
    @lastTransaction = 0
  end 
 
  def add_item(title, price, quantity=1)
    @total += price*quantity;
    quantity.times do @items << title end
    @lastTransaction = price
  end
  
  def apply_discount
    @total = @total * (100-@discount)/100
    if discount > 0 
      "After the discount, the total comes to $#{@total}."
    else
      return 'There is no discount to apply.'
    end
  end
  
  def void_last_transaction
    @total -= @lastTransaction
  end
end   