require 'pry'

class CashRegister
  attr_accessor :total, :last_transaction_total

  def initialize(emp_discount=0)
    @emp_discount = emp_discount
    @total = 0
    @items_list = []
  end

  def discount
    @emp_discount
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    self.last_transaction_total = price * quantity
    #binding.pry
    quantity.times { record_items(title) }
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    self.total = self.total * ((100 - discount)/100.0)
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def items
    @items_list
  end

  def record_items(item)
    items << item
  end

  def void_last_transaction
    self.total -= last_transaction_total
  end
end
