class CashRegister

  attr_accessor :total


  def discount=(discount)
    @discount = discount
  end

  def discount
    @discount
  end

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @@item_hash = {}
    @@item_array = []
  end

  def add_item(title, price, quantity=1)

    @@item_hash[title] = price * quantity

    quantity.times do
    @@item_array << title
    end

    @total = self.total + (price * quantity)

  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      calculated_discount = 1.to_f - @discount/100.to_f
      @total = @total.to_f*calculated_discount.to_f
      @total = @total.to_i
    return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @@item_array
  end

  def void_last_transaction
    last_transaction_price = @@item_hash[@@item_array[-1]]
    new_total = @total - last_transaction_price
    @total = new_total
  end

end
