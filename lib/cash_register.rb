class CashRegister
  attr_accessor :name, :quantity, :price, :discount, :total, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def apply_discount
    self.total = total * 0,5
  end

  def add_item(title,price,quantity = 1)
    @title = title
    @price = price
    @quantity = quantity

    i = 0
    while i < quantity do
       @items << @title
       i += 1
    end

      self.total += @price * @quantity
      self.total
  end

  def apply_discount
    if self.discount == nil
      return "There is no discount to apply."
    else
      discount = (self.total.to_i / 100) * self.discount.to_i
      ntotal = self.total.to_i - discount
      self.total = ntotal
      return "After the discount, the total comes to $#{ntotal}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.price
    self.total
  end

end
