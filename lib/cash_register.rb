class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(regDiscount=nil)
    @total = 0
    @discount = regDiscount
    @items = []
  end

  def void_last_transaction
    self.total = self.total - (self.last_transaction[1] * self.last_transaction[2])

  end


  def add_item(title, price, quantity = 1)
    self.last_transaction = [title, price, quantity]
    self.total += price * quantity
    quantity.times do
      @items<<title
    end


  end

  def apply_discount
    response = nil
    if self.discount
      self.total = self.total - (self.total * self.discount) / 100
      response = "After the discount, the total comes to $#{self.total}."
    else
      response = "There is no discount to apply."
    end

    response
  end
end
