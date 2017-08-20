class CashRegister

  attr_accessor :total, :discount, :list, :last_item

  def initialize(*discount)
    @total = 0
    @discount = discount[0]
    @list = []
    @last_item = nil
  end

  def add_item(title, price, *quantity)
    if quantity == []
      @total += price
      @list << title
      @last_item = price
    else
      @total += price * quantity[0]
      @last_item = price
      quantity[0].times do
        @list << title
      end
    end
  end

  def apply_discount
    if @discount != nil
      discount_rate = 100.0 - @discount
      @total = @total * discount_rate /100.0
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @list
  end

  def void_last_transaction
    @total -= @last_item
  end
end
