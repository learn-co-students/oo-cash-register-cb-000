class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_amt

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end 
  
  def add_item(title, price, quantity=1)
    quantity.times do 
      @items << title
    end
    @total += price * quantity
    @last_transaction_amt = price * quantity
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      applied_discount = @total * (@discount/100.to_f)
      @total = (@total - applied_discount).to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end
  
  def void_last_transaction
    @total -= @last_transaction_amt
  end
  
end
