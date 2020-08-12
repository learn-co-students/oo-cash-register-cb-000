require 'pry'

class CashRegister
  attr_accessor :total, :discount, :quantity, :message, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @list = {}
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    @list["#{title}"] = {
      :price => price,
      :quantity => quantity
    }
  end

  def apply_discount
    if discount > 0
      percentage = self.discount.to_f / 100
      @total -= (@total * percentage).to_i
      @message = "After the discount, the total comes to $#{@total}."
    else
      @message = "There is no discount to apply."
    end
  end

  def items
    titles = []
    @list.each do |item|
      item[1][:quantity].times {titles << item[0]}
    end
    titles
  end

  def void_last_transaction
    last_key = @list.keys.last
    @total -= @list[last_key][:price] * @list[last_key][:quantity]
  end

end
