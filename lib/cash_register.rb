class CashRegister

  attr_accessor :total, :discount, :items, :last_trans_amt

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    #puts discount
  end

  def add_item(title,price,quantity=1)
    quantity.times do
      self.total += price
      self.items << title
    end
    self.last_trans_amt = price*quantity 
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total -= self.total*(self.discount/100.00)
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.last_trans_amt
  end

end
