class CashRegister
  attr_accessor :total # @total SHOULD not be accessible via public writer, but specs say otherwise
  attr_reader :discount, :items
  @last_price = 0      # private attribute
  @last_quantity = 0   # private attribute

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = Array.new
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times { self.items << title }
    @last_price = price
    @last_quantity = quantity
  end

  def apply_discount()
    if self.discount == 0
      return "There is no discount to apply."
    end
    self.total = (self.total * (100 - self.discount)) / 100
    return "After the discount, the total comes to $#{self.total}."
  end

  def void_last_transaction()
    self.total -= @last_price * @last_quantity
  end
end
