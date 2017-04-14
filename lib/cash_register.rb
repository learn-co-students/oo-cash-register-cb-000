class CashRegister
  attr_accessor :total
  attr_reader  :items, :discount
  def initialize(discount=0)
    @total=0
    @discount=discount
    @items=[]

  end

  def add_item(title, price, quantity=1)
    
    previous_items = items.collect{|item|item}
    @rollback = [@total,previous_items]
    @total+=price*quantity
    i = 0
    while i<quantity
      @items << title
      i+=1
    end
  end

  def apply_discount
    @total -= @total*@discount/100
    if @discount>0
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end 
  end

  def void_last_transaction
    @total = @rollback[0]
    @items = @rollback[1]
  end

end
