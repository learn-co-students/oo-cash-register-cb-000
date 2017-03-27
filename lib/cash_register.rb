
class CashRegister

attr_accessor :total, :discount


  def initialize (discount = 0)
    @discount = discount
    @total = 0
    @items=[]
    @last_transaction_amount = 0
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times do
      @items << title
    end
    @last_transaction_amount = price*quantity
  end

  def apply_discount
    if discount==0
      "There is no discount to apply."
    else
    @total -= @total*discount/100
    "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction_amount
  end
  
end
