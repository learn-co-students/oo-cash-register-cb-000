class CashRegister

  attr_accessor :total, :discount, :item_title, :price, :quantity, :last_transaction

  @@total = 0
  @@items = []
  @@last_transaction = 0

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @@items.clear
  end

  def self.total
    @@total
  end

  def add_item(item_title, price, quantity=1)
    self.total += (quantity * price)
    quantity.times do
      @@items << item_title
    end
    self.last_transaction = (quantity * price)
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    else
      self.total = ((100-discount)/100.0) * @total
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @@items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
