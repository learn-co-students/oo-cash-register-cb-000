
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize( discount=0 )
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item( item, price, quantity=1 )
    if quantity != 0
      price *= quantity
      quantity.times do
        @items << item
      end

    end
    self.last_transaction = price
    @total += price
  end

  def apply_discount

    if self.discount != 0
      self.total *= ((100.00 - self.discount)/100.00)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end

  end

  def void_last_transaction
    self.total -= self.last_transaction

  end

end  # class CashRegister
