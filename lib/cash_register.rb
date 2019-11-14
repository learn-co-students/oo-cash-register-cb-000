class CashRegister
  
  attr_accessor :total, :discount, :basket, :price, :last_trans, :last_qty
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @basket = []
  end
  
  def add_item(title, price, quantity = 1)
    @price = price
            @last_trans = price
@last_qty = quantity
    if quantity > 1
      counter = 0 
      while counter < quantity
      @total = (@total + price)
      @basket << title
      counter += 1
    end
      else
        @total = (@total + price)
        @basket << title 
        end
      end
  
  def apply_discount
    if @discount > 0
  @total = (@total * ((100-@discount.to_f)/100))
  return "After the discount, the total comes to $#{total.to_i}."
else return "There is no discount to apply."
end
end

def items
  return @basket
end

def void_last_transaction
 @total = (@total - (@last_trans * @last_qty))
end

end