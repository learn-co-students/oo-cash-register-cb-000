
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction, :last_transaction_array



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction_array = []

  end

  def add_item(product, price, quantity = 1)
    @last_transaction = price * quantity
    @last_transaction_array = []
    @total = @total + (price * quantity)
    quantity.times {@items << product}
    quantity.times {@last_transaction_array << product}
  end

  def void_last_transaction
    @total = @total - @last_transaction
    @items - @last_transaction_array
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else

      @total = ((@total * (100.00 - @discount.to_f))/100.00).to_int
      @total.to_int
      success_message = "After the discount, the total comes to $#{@total}."
      return success_message
    end
  end


end
