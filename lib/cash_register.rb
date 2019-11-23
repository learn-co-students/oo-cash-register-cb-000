class CashRegister
  attr_accessor :total, :discount, :items, :the_last_transaction
  

  def initialize (discount = 0)
    @total = 0    #This gives a zero total at initialization
    @discount = discount 
    @items = [ ]  #This will inititalize items with am empty array
  end 

  #The add_item method is going to increase the total and store the current total, shovel 
  # each item into the item array, and return the amount of the very last transaction.
  def add_item (title, price, quantity=1)
    self.total += price *quantity  #Here we increase the total by the price times quantity of item
    quantity.times do 
      items << title
    end
    self.the_last_transaction = price * quantity
  end

  #The apply_discount method applies the discount to the total price if one exits,
  #returns the updated total or tells that there is no discount. We converted the discount
  #to a float, divided by 100, and then turned the entire new total to an integer
  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        "After the discount, the total comes to $#{self.total}."
    
    else
       "There is no discount to apply."
    end
  end


  def void_last_transaction
    self.total = self.total - self.the_last_transaction
  end 

end 
