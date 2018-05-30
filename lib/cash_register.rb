class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = {}
  end

  # def self.
  def add_item(item, price, quantity = 1)
    @total += price * quantity
    list = Array.new(quantity, item)
    @items << list
    @items.flatten!
    @last_transaction = {last_price: price, last_quant: quantity}
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = self.total * (100-discount)/100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def total
    @total
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction[:last_price]
    @items.pop(@last_transaction[:last_quant])
  end

end
