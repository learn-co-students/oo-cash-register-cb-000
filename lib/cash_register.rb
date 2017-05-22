class CashRegister

  attr_accessor :discount, :total



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @transaction = (price * quantity)
    @total += @transaction
    quantity.times {@items << title}
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total = @total - @total * (@discount/100.0)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transaction
  end


end
