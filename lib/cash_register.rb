class CashRegister
  attr_accessor :total, :discount, :items


  def initialize(discount = 0)
      @discount = discount
      @total = 0
      @items = []
      @last_transcation_price = 0
  end

  def add_item(item, price, quantity = 1)
    quantity.times do
      @items << item
    end
    @total += (price * quantity)
    @last_transcation_price = (price * quantity)
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total *= ((100 - @discount) / 100.0)
      # Drop trailing zeros
      @total = @total.to_i if @total == @total.to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @last_transcation_price
    @last_transcation_price = 0
  end

end
