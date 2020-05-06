class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

#sets an instance variable @total on iniitalization to zero
#optionally takes an employee discount on initialization
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

#add_item method:
#accepts a title and a price and increases the total
#also accepts an optional quantity
#doesn't forget about the previous total
  def add_item(title, price, quantity=1)
      self.total += price * quantity
      quantity.times do
        items << title
      end
    self.last_transaction = price * quantity
  end

#apply_discount method:
#applies the discoutn to the total price
#returns success message with updated total
#reduces the total

  def apply_discount
    if discount > 0
      self.total = (total * (100 - discount))/100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

#void_last_transaction method:
#subtracts the last transaction from the total

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end



end
