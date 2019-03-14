class CashRegister
  attr_accessor :items, :discount, :total, :transactions
  
  def initialize(discount = 0)
    @items = []
    @discount = discount
    @total = 0
    @transactions = []
  end 
  
  def add_item(title, price, quantity=1)
    quantity.times {self.items << title}
    self.total += (price * quantity)
    self.transactions << price
  end 
  
  def apply_discount
    if @discount == 0 
      "There is no discount to apply."
    else
      self.total = self.total - (self.total * self.discount)/100
      "After the discount, the total comes to $#{self.total}."
    end   
  end 
  
  #def items
    #returnm @items
  #end 
  
  def void_last_transaction
    self.total -= transactions.last
    transactions.pop
  end 
  
end 
