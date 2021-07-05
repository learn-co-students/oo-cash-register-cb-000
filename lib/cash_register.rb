class CashRegister

  attr_accessor :discount, :total, :items, :price

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def self.total
    @total
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @price = price
    quantity.times {|i| self.items << title}
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total *= (1 - (@discount / 100.0))
    end
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @price
  end
end
