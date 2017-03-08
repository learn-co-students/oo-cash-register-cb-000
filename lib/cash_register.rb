class CashRegister
  attr_accessor :total, :discount, :list

  def initialize discount = 0
    @discount = discount
    @total = 0
    @list = []
  end

  def add_item title, price, quantity = 1
    item = Hash.new
    item[:title] = title
    item[:price] = price
    item[:quantity] = quantity
    @list << item
    @total += quantity * price
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    list_items = []
    @list.each do |list_item|
      for item in 1..list_item[:quantity]
        list_items << list_item[:title]
      end
    end
    list_items
  end

  def void_last_transaction
    @total -= @list.last[:quantity] *@list.last[:price]
    @list.pop
    @total
  end

end
