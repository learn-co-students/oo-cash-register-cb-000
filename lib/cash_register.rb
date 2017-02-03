class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(name, cost, quantity=1)
    @total+=cost*quantity
    quantity.times {@items << name}
    @last_charge = cost*quantity
  end

  def apply_discount
    if discount > 0
      @total -= (@total/100.0)*discount
      "After the discount, the total comes to $#{@total.round}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total-=@last_charge
  end

end
