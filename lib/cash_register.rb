class CashRegister
  attr_accessor :total, :discount, :transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end
 def add_item(title,price,qty=1)
   self.total += price * qty
   @transaction << self.total
   qty.times do|item|
   @items << title
  end
 end
 def apply_discount
   self.total = @total - (@total * @discount)/100
   if @discount >0
      return "After the discount, the total comes to $#{@total}."
   else
      return "There is no discount to apply."
   end
 end
 def items
   @items
 end
 def void_last_transaction
   self.total = @total - @transaction[@transaction.length - 1]
 end
end
