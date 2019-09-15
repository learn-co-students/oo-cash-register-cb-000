class CashRegister
  
  attr_accessor :total, :discount, :last_transaction
  def initialize(discount = 0)
    @last_transaction = 0
    @items = []
    @discount = discount
    @total = 0
  end
  
  def add_item(title, price, quantity=1)
    quantity.times do
      self.items << title
    end
    self.last_transaction = quantity * price
    self.total += quantity * price
  end
  
  def apply_discount
    self.total -= (self.total * self.discount)/100
    if self.discount != 0
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    self.total -= self.last_transaction
    
  end
end
