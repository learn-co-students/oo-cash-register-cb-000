require 'pry'
class CashRegister
attr_accessor :total, :discount, :items


  def initialize (discount = nil)
    @total = 0
    @discount = discount
    @items =[]
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times {@items << title}
    @transaction = price * quantity

  end

  def apply_discount
    if @discount == nil
    return "There is no discount to apply."
    else
      @total *= (1-(@discount/100.0))
    return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @transaction

  end


end
