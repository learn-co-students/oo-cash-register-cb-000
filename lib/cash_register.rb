class CashRegister
  attr_accessor :total, :discount, :item, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @all_items = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times {@all_items << item}
    @total += (price * quantity)
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount !=0
      @total = @total - (@total * (@discount/100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
  
end