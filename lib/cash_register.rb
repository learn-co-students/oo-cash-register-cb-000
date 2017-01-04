class CashRegister 
  attr_accessor :discount, :total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @items << title
      @items << price
    end
  end

  def apply_discount
    if discount
      self.total -= self.total * discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.select {|x| x.is_a?(String)}
  end

  def void_last_transaction
    @total -= @items.last
  end
  
end
