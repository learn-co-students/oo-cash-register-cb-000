class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @all_items = []
    @detailed_list = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @all_items << title
    end
    @detailed_list << [title, price, quantity]
    self.total += quantity * price
  end

  def apply_discount
    if self.discount != nil
      self.total = (((100.to_f - self.discount)/100) * self.total).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    last_transaction = @detailed_list.last
    self.total -= last_transaction[1] * last_transaction[2]
  end
end
