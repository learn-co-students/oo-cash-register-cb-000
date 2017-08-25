class CashRegister
  attr_reader :discount, :items, :last_transaction
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = quantity * price
    @total += @last_transaction

    quantity.times do
      @items ? @items << title : @items = [title]
    end
  end

  def apply_discount
    if @discount != 0
      @total = @total * (100 - @discount) / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @items.pop
    @total -= @last_transaction
  end
end
