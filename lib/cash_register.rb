require 'pry'
# implements CashRegister according to spec
class CashRegister
  attr_accessor :total, :item_list, :discount

  def initialize(discount = nil)
    @total = 0.0
    @item_list = [] # [name_of_item, price, quantity]
    @discount =  discount.to_f
  end

  def add_item(title, price, quantity = 1)
    found = false
    @item_list.each do |item_array|
      if item_array[0] == title
        item_array[1] = price
        item_array[2] = item_array[2] + quantity
        found = true
      end
    end
    found || @item_list << [title, price, quantity]
    @total += price * quantity
  end

  def apply_discount
    # binding.pry
    if @discount > 0.0
      @total -= @total * (@discount / 100)
      # thanks https://stackoverflow.com/questions/18533026/trim-a-trailing-0 for the regex
      "After the discount, the total comes to $#{@total.to_s.gsub(/(\.)0+$/, '')}."
    else
      'There is no discount to apply.'
    end
  end

  def items
    working_item_list = []
    @item_list.each do |item_array|
      quantity = item_array[2]
      quantity.times do
        working_item_list << item_array[0]
      end
    end
    working_item_list
  end

  def void_last_transaction
    item_array = @item_list.pop
    item_quantity = item_array[2]
    item_price = item_array[1]
    @total -= item_quantity * item_price
  end
end
