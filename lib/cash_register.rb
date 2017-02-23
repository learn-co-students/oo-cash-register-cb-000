
class CashRegister

  attr_accessor :total, :discount

  def initialize(total=0, discount=20)

    @total = total
    @discount = discount

  end


  def add_item(title, price, quantity = 1)

    self.total += price*quantity

  end

  def apply_discount
    self.total -= (self.total*@discount.to_i/100)

  end
  def items
    

  end
end
