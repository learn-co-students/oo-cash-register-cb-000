require 'pry'
class CashRegister
  attr_accessor :total, :discount, :last_transaction
  
  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
  end
  
  def add_item(title, price, quantity = 1)
    quantity.times do 
      @items << title
    end
    @total += quantity * price  
    @last_transaction = quantity * price
  end
  
  def apply_discount
    if @discount != 0
      @total = (@total - @discount/100.0 * @total).to_i
      "After the discount, the total comes to $#{@total}."
    else 
      "There is no discount to apply."
    end
  end
  
  def items 
    @items
  end
  
  def void_last_transaction
    @total = @total - @last_transaction
  end

end
