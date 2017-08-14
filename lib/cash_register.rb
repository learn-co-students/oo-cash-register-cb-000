class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    @transaction_total = price * quantity
    @transaction_items = Array.new(quantity, item)
    @total += @transaction_total
    @items += @transaction_items
  end

  def apply_discount
    if discount > 0
      @total = @total * (100-@discount) / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transaction_total
    @items -= @transaction_items
  end

end
