class CashRegister
  attr_accessor :total, :discount, :cart, :previous_quantity, :previous_total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @previous_total = @total
    @total += price * quantity
    @previous_quantity = quantity
    quantity.times { @items << item }
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total * (100 - @discount) / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total = @previous_total
    @previous_quantity.times { @items.pop() }
  end

end
