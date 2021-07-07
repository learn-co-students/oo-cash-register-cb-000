
class CashRegister
  attr_accessor :items, :total, :discount, :last_transaction

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end
  def add_item(title, amount, quantity=1)
    self.total += amount * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = amount * quantity
  end
  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
       "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = total - last_transaction
  end
end
