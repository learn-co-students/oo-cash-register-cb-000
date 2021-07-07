class CashRegister
  attr_accessor :discount, :total, :items, :last_item

  @@all = []

  def initialize (discount = nil)
    @@all << self
    @total = 0
    @items = []
    @last_item = 0
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
    @last_item = price * quantity
    c=1
    while c <= quantity
      @items << title
      c +=1
    end
    @total += (price * quantity)
  end

  def apply_discount
    result = nil
    if @discount != nil
      @total -= (@total * (@discount/100.00))
      result = "After the discount, the total comes to $#{'%.00f' % @total}."
    else
      result = "There is no discount to apply."
    end
    result
  end

  def void_last_transaction
    @total = @total - @last_item
    @items.pop
  end

end
