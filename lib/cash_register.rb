class CashRegister

  attr_accessor :total
  attr_reader :discount, :items, :last

  def initialize(discount = nil)
    @last = ''
    @items = []
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity = nil)
    @last = price

    if quantity.nil?
      @total += price
      @items << title
    else
      @total += (price*quantity)
      quantity.times {@items << title}
    end
  end

  def apply_discount
    # whut is discount
    if !@discount.nil?
    @total -= @total * (@discount / 100.0)
    "After the discount, the total comes to $#{@total.to_i}."
  else
    "There is no discount to apply."
  end
  end

  def void_last_transaction
    # feel like that test not robust
    # last price instance var?? lel

    @total -= @last

  end
end
