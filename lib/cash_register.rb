require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_total
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items = []
    @last_transaction_price = 0
  end
  
  def add_item(title, price, quantity=1)
    @total += price * quantity
    @last_transaction_total = price * quantity
    quantity.times do 
      @@items << title
    end
  end
  
  def apply_discount
    @total *= 1-@discount.to_f/100
    if @discount == 0 
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total.round}."
    end
  end
  
  def items
    @@items
  end
  
  def void_last_transaction
    @@items.pop
    @total -= last_transaction_total
  end
end