class CashRegister

  attr_accessor :total, :discount, :items, :price

  def initialize(discount = 0, total = 0)
    @discount = discount
    @total = total
    @items = []
    @price = price


  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    @total += quantity * price
    #quantity.times {@items << item}
    quantity.times do
    @items << item
  end
  @last_item = price * quantity
end


  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = (@total * ( 100 - @discount)) / 100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items

  end

  def void_last_transaction

    @total = @total - @last_item

  end







end
