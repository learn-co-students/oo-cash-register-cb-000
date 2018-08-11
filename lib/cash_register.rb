
class CashRegister
  attr_accessor :total, :discount

  def total
    @total
  end

  def initialize(discount = 0)
    @total = 0.0
    @items = []
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @items << {:title => title, :price => price, :quantity => quantity}
      @total += price
    end
  end

  def apply_discount
    if @discount != 0
      @total *= 1.0 - Float(@discount) / 100.0
      "After the discount, the total comes to $#{Integer(@total)}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.collect do |item|
      item[:title]
    end
  end

  def void_last_transaction
    last_item_price = @items[-1][:price]
    @total -= last_item_price
    items.pop
  end
end
