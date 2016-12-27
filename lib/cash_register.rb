class CashRegister

  attr_accessor :total , :items, :last_transaction

  attr_reader :discount

  def initialize(discount=1)
    @total = 0
    @discount = discount
    @items =[]
  end

  def add_item(title,price, quantity=1)
    if quantity > 0
      @total+=(price.to_f*quantity)
    else
      @total += price.to_f
    end

    each_title = title.split(',')*quantity
    @items <<each_title
    @items.flatten!
    @last_transaction = price * quantity
  end

  def apply_discount
    if self.total == 0
      "There is no discount to apply."
    else
      quotient = @discount.to_f / 100.to_f #.to_f is to avoid a nil when the discount or quotient returns with a decimal place
      total_discount = self.total * quotient
      self.total = self.total - total_discount
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end 
end
