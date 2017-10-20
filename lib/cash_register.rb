class CashRegister
  attr_accessor :last_transaction, :total, :discount, :items

  def initialize(discount=0)
    @total = 0.0
    @discount= discount
    @items= []
    @last_transaction = "none"
  end


  def add_item(name, price, quantity=1)
    self.total += (price *quantity * 100.0) / 100.0
    self.last_transaction = price * quantity

    quantity.times do
      items << name
    end
  end



def apply_discount
  if (discount == 0)
    return "There is no discount to apply."
  else
    self.total -= (self.total ) * (self.discount / 100.0)
    return "After the discount, the total comes to $#{self.total.to_i}."
  end
end

  def void_last_transaction
    self.total -= self.last_transaction.to_f
  end
end
