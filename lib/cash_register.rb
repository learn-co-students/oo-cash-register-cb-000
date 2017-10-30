class CashRegister
  attr_accessor :total, :discount

  def initialize(discount= 0)
  @total = 0
  @discount = discount
  @items = []
  @cart =[]
  end

  def total
     @total
  end

  def add_item(title, price, quantity= 1)
    item={}
    @item = item
    item[:title]= title
    item[:price]= price
    item[:quantity]=quantity
    @total += price*quantity
     quantity.times do
     @items << title
   end
   @cart << item
  end

  def apply_discount
    @total -= @total*@discount /100
    @discount == 0 ? "There is no discount to apply." :  "After the discount, the total comes to $#{@total}."
  end

  def items
    @items
  end

  def void_last_transaction
    @cart.pop
    @total = @cart.inject(0) { |sum, tuple| sum += tuple[1] }
    @total
  end

end
