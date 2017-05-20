class CashRegister
  attr_accessor :total, :discount, :items, :last_price


  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_price = price * quantity
    (1..quantity).each {|_| @items << title}
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      discount = @discount.to_f/100.00
      @total -=  (discount * @total)
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_price
  end

end
