class CashRegister

  attr_accessor :total, :discount, :allitems, :previous_item, :previous_price, :previous_qty



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @allitems = []
  end

  def add_item(item,price,qty = 1)
    @previous_price = price
    @previous_item = item
    @previous_qty = qty

    @total += (price * qty)
    x=0
    while  x < qty
      @allitems.push(item)
      x += 1
    end
  end

  def apply_discount
    if (discount != 0)
      @total = @total * (100-@discount) / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @allitems
  end

  def void_last_transaction
    @total -= @previous_price
      #@allitems.pop(@previous_item)
  end

end
