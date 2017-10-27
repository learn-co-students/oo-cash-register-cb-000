
class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @trans = 0
    @items = []
  end

  attr_accessor :total, :discount, :trans, :items

  def add_item(title, price, cnt = 1.0)
    @trans = price * cnt
    @total += @trans
    @items += [title]*cnt
  end

  def apply_discount
    if (@discount > 0)
      @total = @total * (1.0-(@discount*0.01))
      "After the discount, the total comes to \$#{@total.to_i}."  #to_i is only because the test doesn't like the float total
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @trans
  end

end
