class CashRegister
  attr_accessor :total , :discount , :title , :price , :quantity

  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end

  def add_item(title , price , quantity = 1)
    self.total += price * quantity
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

end
