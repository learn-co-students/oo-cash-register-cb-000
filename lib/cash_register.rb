class CashRegister

  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = Array.new
    @transactions = Array.new
  end

  def add_item(item, price, quantity=1)
    quantity.times {self.items << item}
    self.total += (price * quantity)
    self.transactions << price
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      self.total = self.total - (self.total * self.discount)/100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total -= transactions.last
    transactions.pop
  end

end
