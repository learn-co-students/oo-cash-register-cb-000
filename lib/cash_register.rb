class CashRegister
  attr_accessor :total, :transaction
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @items = []
    @transaction = []
    @discount = discount
  end

  def add_item(name, amount, quantity = 1)
    self.total += amount * quantity
    quantity.times {self.items << name}
    self.transaction = [name, amount, quantity]
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total *= (1 - @discount/100.0)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    transaction[2].times {self.items.pop}
    self.total -= transaction[1] * transaction[2]
  end
end
