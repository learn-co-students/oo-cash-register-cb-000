class CashRegister
  attr_accessor :total, :discount, :items, :name, :last_transaction

  def initialize(discount=0)
    @total = 0.00
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(name, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
    @items << name
   end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total = (self.total * ((100.0 - self.discount)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end


  def void_last_transaction
    self.total = self.total - self.last_transaction
  end


end
