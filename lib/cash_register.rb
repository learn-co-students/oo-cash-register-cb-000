require 'pry'

class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :transaction
  attr_reader :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = nil)
    if quantity
      @total += price * quantity
      @transaction = price * quantity
      quantity.times do
        @items << title
      end
    else
      @total += price
      @transaction = price
      @items << title
    end
  end

  def apply_discount
    if @discount
      @total -= (@discount * 10)
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transaction
  end

end
