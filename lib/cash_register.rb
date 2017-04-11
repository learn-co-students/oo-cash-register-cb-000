class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(product, price, quantity=1)
    @amount_transaction = price * quantity
    @items_transaction = Array.new(quantity,product)
    @total += @amount_transaction
    @items += @items_transaction
  end

  def apply_discount
    if discount > 0
      @total = @total * (100 - @discount) / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @amount_transaction
    @items -= @items_transaction
  end

end
