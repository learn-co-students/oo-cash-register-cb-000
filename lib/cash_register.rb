class CashRegister
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(item, price, quantity=1)
    transaction = price * quantity
    transactions << transaction
    quantity.times { items << item }
    self.total += transaction
  end

  def apply_discount
    if self.discount
      self.total *= 1 - (self.discount.to_f / 100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= transactions.pop
  end
end
