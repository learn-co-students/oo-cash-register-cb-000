class CashRegister
  attr_accessor :total, :discount, :last_add
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @all = []
  end 
  
  def add_item(title, price, quantity = 1)
    @last_add = price * quantity
    @total += price * quantity
    quantity.times { @all << title }
  end

  
  def apply_discount
    return "There is no discount to apply." if @discount == 0
    
    @total = @total * (100 - @discount) / 100
    return "After the discount, the total comes to $#{total}."
  end
  
  def items
    @all
  end 
  
  def void_last_transaction
    @total -= @last_add
  end 
  

end 
