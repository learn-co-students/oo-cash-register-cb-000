
class CashRegister

  attr_accessor :total, :discount, :price, :quantity, :title, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title,price, quantity = 1)
    self.title = title
    self.price = price
    self.quantity = quantity
    self.total += price * quantity
    count = 0
    while count < quantity
      self.items << self.title
      count += 1
    end

  end

  def apply_discount

    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - (@total * @discount/100)

      @total
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - self.price

  end


end
