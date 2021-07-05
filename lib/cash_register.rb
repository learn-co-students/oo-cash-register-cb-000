class CashRegister
  attr_accessor :total, :prev_total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @prev_total = 0
    @discount = discount.to_f
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @prev_total = @total
    @total += price * quantity

    #i = 0
    #while i < quantity do
    # => @items << title
    #end
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = (@total * (100 - @discount)/100).round
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @prev_total
  end

end
