require 'pry'
class CashRegister
  attr_accessor :total, :items, :transaction, :discount

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
  end

  def add_item(title,price,qty=1)
    #store last transaction
    @transaction = [title, price, qty]
    qty.times do
      items << title
    end
    @total += (price * qty)
  end

  def apply_discount
    if discount != 0
      #apparrently you need to convert to float before conversion then back into int
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    #binding.pry
    @total = @total - (@transaction[1]*@transaction[2])
  end

end
