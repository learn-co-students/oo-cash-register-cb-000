class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize (discount=0)
    @total = 0
    @discount = discount
    @items = []

  end

  def add_item item, price, quantity=1
    quantity.times do |n|
      @total += price
      @items << item
      @total
      @last_item = {item: item, total_charge: price * quantity}
    end
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total -= @total * @discount / 100
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @total -= @last_item[:total_charge]
  end

end
