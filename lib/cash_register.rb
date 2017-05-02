class CashRegister

  attr_accessor :discount, :total, :price

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(title, price, quantity=1)
    @total = @total + price*quantity
    @prices << price
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount != nil
      @total = @total - (@total * @discount.to_i / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @prices.last
  end

end
