class CashRegister
  attr_accessor :total, :discount, :list

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @list = []
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    @list << [title, price, quantity]

  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total = @total * (100 - @discount) / 100
    return "After the discount, the total comes to $#{@total.floor}." if @total.floor == @total
    "After the discount, the total comes to $#{@total}."
  end

  def items
    items = []
    @list.each do |trans|
      trans[2].times do
        items << trans[0]
      end
    end
    items
  end

  def void_last_transaction
    return if @list == []
    item = @list.pop
    @total = @total - item[1] * item[2]
  end

end
