class CashRegister

attr_accessor :total



def initialize(age = 0)
    @total = 0
    @discount= age
    @titles = []
    @transaction = []   #### if you add an array to track variables when initialized it can be used to track anything added whilst the instatnce is being operated on with methods liek add
end

def discount
  @discount
end

def add_item(title,price,quantity=1)
 @quantity = quantity
  self.total += price * @quantity
  @transaction << price
  count = @quantity
  if @quantity>1
    until count == 0
     @titles << title
     count -= 1
   end
 else
    @titles <<title
  end

end

def items
  @titles
end

def apply_discount


 discount_percentage = (self.discount).to_f/100
 discount =  (self.total*discount_percentage)
 total_changed = self.total - discount
 self.total = total_changed
 if self.discount == 0
   return "There is no discount to apply."
 else
   return"After the discount, the total comes to $#{self.total.to_i}."
 end

end

def void_last_transaction

  if @transaction.size  ==1 || @transaction.empty?
    self.total = 0.0
  else
    price_of_last_transcation = @transaction[@transaction.size-1]
    total_before_change = self.total
    self.total =  total_before_change - price_of_last_transcation
  end

end


end
