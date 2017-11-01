class CashRegister
  attr_accessor :total, :discount, :items, :price

  def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
  end

  def add_item(title,price,quantity = 1)
    if quantity == 1
      @total +=price
    else
      @total += (price * quantity)
    end
    quantity.times{
      @items << title
    }
    @price = price
  end

  def apply_discount
    return_message = ""
    if discount == 0
      return_message = "There is no discount to apply."
    else
      calculated = (total*discount)/100
      @total -= calculated
      return_message = "After the discount, the total comes to $#{@total}."
    end
    return_message
  end

  def void_last_transaction
    @total -= @price
  end
end
