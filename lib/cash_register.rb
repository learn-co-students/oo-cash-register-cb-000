class CashRegister

  attr_accessor :total, :discount, :items, :last_total



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, qty = 1)
    @last_total = price*qty
    @total += @last_total
    qty.times do @items << item
    end
  end

  def apply_discount
    if @discount > 0
      @total *= 1-(@discount/100.0)
      msg = "After the discount, the total comes to $#{@total.to_i}."
    else
      error_message =  "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_total
  end

end
