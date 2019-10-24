class CashRegister
  attr_reader :discount, :items
  attr_accessor :total
  def initialize(discount=0)
    @items=[]
    @total=0
    @discount=discount
    @transaction=[]
  end

  def add_item(title, price, quantity=1)
    self.total+=price*quantity
    quantity.times do
      @items << title
    end
    @transaction << price*quantity
  end

  def apply_discount
    if @discount==0
      "There is no discount to apply."
    else
      @total*=(100-@discount)/100.00
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total-=@transaction.last
  end
end
