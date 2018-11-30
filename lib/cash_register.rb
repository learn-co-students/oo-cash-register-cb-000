class CashRegister
  attr_accessor :total, :transactions, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @transactions = []
    @items = []
  end

  def trim(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

  def add_item(title, price, quantity = 1)
    quantity.times do |i|
      @total += (price)
      self.last_transaction = (price)
      self.items = title
    end
  end

  def last_transaction
    self.transactions.last
  end

  def items
    @items
  end

  def items=(item)
    self.items.push(item)
  end

  def last_transaction=(value)
    self.transactions.push(value)
  end

  def void_last_transaction
    catch = self.transactions.pop
    self.total -= catch
    self.items.pop
  end

  def apply_discount
    discount_to_take = self.total * discount / 100.0
    self.total = self.total - discount_to_take
    if discount > 0
      "After the discount, the total comes to $#{trim(self.total)}."
    else
      "There is no discount to apply."
    end
  end
end
