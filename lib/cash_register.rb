class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  
   def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = last_transaction
  end
  
  def total()
    @total
  end
  
  def add_item(title, price, quantity = 1)
     @total += (price.to_f * quantity) 
     @last_transaction = (price.to_f * quantity) 
     while quantity >= 1
     @items.push(title) 
     quantity -= 1
    end
  end

  def apply_discount()
    if self.discount == 0
      return "There is no discount to apply."
    else
    percent_off = self.discount.to_f / 100.0 
    @total = @total - (percent_off * @total)
    return "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def items()
    @items
  end
  
  def void_last_transaction()
    @total -= @last_transaction
  end
  
end
