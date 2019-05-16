class CashRegister

  attr_accessor :total, :discount, :items, :last


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last = price * quantity
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      discount_price= ((total * discount)/100)
      @total = self.total - discount_price
      "After the discount, the total comes to $#{total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = self.total - self.last
  end


end
