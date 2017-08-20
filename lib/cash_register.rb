require 'Pry'
class CashRegister 
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, amount=1)
      self.total += price * amount
      amount.times do
        self.items << title
      end
      self.last_transaction = price * amount
  end

  def apply_discount()
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= last_transaction
  end
end