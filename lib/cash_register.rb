
class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(total=0, discount=20)

    @total = total
    @discount = discount
    @items = []
  end


  def add_item(title, price, quantity = 1)

    self.total += price*quantity
      quantity.times do
    @items << title
  end
  end

  def apply_discount
    if discount != 0
    self.total = (total -(total*discount.to_f)/100).to_i

  end

end
