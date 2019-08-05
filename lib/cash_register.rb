require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :items_with_prices

  def initialize(employee_discount=0)
    @total = 0
    @discount = employee_discount
    @items = []
    @items_with_prices = []
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @items << title
    end
    charge_total = quantity * price
    @total += charge_total
    @items_with_prices << {title: title, price: price}
  end

  def apply_discount
    if @discount > 0
      @total = @total.to_f * ((100 - @discount.to_f ) / 100)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    last_item = @items_with_prices.last
    @total = @total - last_item[:price]
    @items_with_prices.pop
    if @items_with_prices.empty?
      @total = 0
    end
  end

end
