class CashRegister
  attr_accessor :discount, :total

  def initialize employee_discount = 0
    @total = 0
    @discount = employee_discount
    @items = []
    @transactions = []
  end

  def items
    @items
  end

  def transactions
    @transactions
  end

  def add_item title,price,quantity=1
    self.total += price*quantity
    self.transactions << price * quantity
    quantity.times {self.items << title}
  end

  def apply_discount
    if self.discount != 0
     self.total = (self.total * ((100 - self.discount) / 100.0)).to_i
     "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    puts self.total
    puts self.transactions
    self.total -= self.transactions[self.transactions.length - 1]
  end

end

chaching = CashRegister.new 20
chaching.add_item("macbook air", 1000)
chaching.apply_discount
chaching.void_last_transaction
