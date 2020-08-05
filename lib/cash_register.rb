class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    # @argument = argument
    # self.discount(discount_amount)
  end

  # def discount(discount)
  # end

  # def total
  #   @total
  # end

  # def add_item(title, price, quantity = 1)
  #   # @original_total = @total
  #   @total = @total + price * quantity
  #   @items << title
  #   # @quantity = quantity
  # end

  def add_item(title, amount, quantity=1)
  self.total += amount * quantity
  quantity.times do
    items << title
  end
  self.last_transaction = amount * quantity
end

  def apply_discount
    if @discount > 0
      @total = @total * (1.0 - (@discount/100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      @total
      "There is no discount to apply."
    end

  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
    self.total
  end

end
