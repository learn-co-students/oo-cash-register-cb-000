
class CashRegister

  attr_accessor :total, :item, :price, :last_trans
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      self.item << item
    end
    self.last_trans = price * quantity
  end

  def apply_discount
    if discount > 0
      self.total = (total - (total * (discount/100.to_f))).to_i
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    self.total = self.total - self.last_trans
  end


end
