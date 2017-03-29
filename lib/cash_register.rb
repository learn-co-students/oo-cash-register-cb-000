class CashRegister 

  attr_accessor :total

  attr_reader :discount  

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times.each { @items << title }
    @previous_total = @total
    @total += price * quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      discount_amount = @discount/100.to_f
      discount_amount = discount_amount * @total
      @total -= discount_amount
      @total = @total.to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @previous_total
  end

end

