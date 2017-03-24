require "pry"

class CashRegister

  attr_accessor :discount, :total, :items, :transactions
  
  def initialize(employee_discount = 0) 
    @total =  0
    @discount = employee_discount
    @items = []
    @transactions = [] 
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @transactions << price * quantity
    quantity.times{ @items << title}
   
  end

  def apply_discount
    if @discount != 0 
      @total -= (@discount * @total /100) 
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transactions.last
  end
end
