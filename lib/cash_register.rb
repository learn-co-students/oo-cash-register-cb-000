class CashRegister
  attr_accessor :total, :discount, :itmes, :last_transaction


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    @total = self.total + (price*quantity)
    @last_transaction = (price*quantity)
    quantity.times {self.items << item}
  end

  def apply_discount
    if discount != 0
      @total = self.total * ((100.0-discount)/100)
      "After the discount, the total comes to $#{@total.round}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = self.total - @last_transaction
  end

end
