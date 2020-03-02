class CashRegister
  
  attr_accessor :discount, :total, :items
  
  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
  end
  
  def add_item(item, price, quantity = 1)
    @last_transaction_price = price
    @last_transaction_quantity = quantity
    @total += (price * quantity)
    quantity.times {
      @items << item
    }
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items
    return @items
  end
  
  def void_last_transaction
    @last_transaction_quantity.times {
      @items.pop
    }
    @total -= (@last_transaction_price * @last_transaction_quantity)
  end
  
  
end





