require 'pry'
class CashRegister
  attr_accessor :total , :discount , :last_trasaction

  @items = []

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title , price , quantity = 1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last_trasaction = quantity * price
  end

  def apply_discount
    if @discount >= 1
      discounted_total = @total - (@total * (@discount.to_f / 100)).to_i
      @total = discounted_total
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_trasaction
  end

end
