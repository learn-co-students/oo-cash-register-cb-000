class CashRegister

  attr_accessor :total, :previous_total

  attr_reader :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times.each { @items << title }
    @previous_total = self.total
    self.total += price * quantity
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      discount_amount = self.discount/100.to_f
      discount_amount = discount_amount * self.total
      self.total -= discount_amount
      self.total = self.total.to_i
      return "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.previous_total
  end

end
