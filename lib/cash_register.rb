class CashRegister
  attr_accessor :last_transaction, :total, :items, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times { |number| @items << item }
    @last_transaction = price * quantity
    @total += @last_transaction
  end

  def items
    @items
  end

  def apply_discount
    if @discount != 0
      @total = @total - (@total * (@discount.to_f/100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def total
    @total
  end

  def void_last_transaction
    self.total -= last_transaction
  end
end
