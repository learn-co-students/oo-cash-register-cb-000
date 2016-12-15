require 'pry'
class CashRegister
  attr_accessor :discount, :total
  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity = 1)
    transaction_amt = price * quantity
    @total += transaction_amt
    @transactions << transaction_amt
    quantity.times do
      @items << title
    end

  end

  def apply_discount
    if discount
      @total *= (1.0 - discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_transaction = @transactions.pop
    @total -= last_transaction
  end
end
