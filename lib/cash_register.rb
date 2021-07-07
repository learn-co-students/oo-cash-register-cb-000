require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price * quantity
    self.total = @total + @price
    @items.fill(title, @items.size, quantity)
    @last_item = @price
  end

  def apply_discount
    @discount = @discount.to_f / 100
    @subtraction = @discount * @total
    @total = @total - @subtraction
    if @discount != 0
    then
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_item
  end
end
