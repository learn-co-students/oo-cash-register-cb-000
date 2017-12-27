class CashRegister
  attr_reader :items, :prices, :discount, :set_total

  def initialize(discount = 0)
    @discount_applied = false
    @discount = discount
    @items = []
    @prices = {}
    @total = 0
    @set_total = nil
  end

  def add_item(item, cost, quantity = 1)
    quantity.times do
      @items << item
    end
      @prices[item] = cost
  end

  def total
    if @set_total != nil
      @total = @set_total
      @set_total = nil
    else
      @total = 0
      @items.each do |item|
        @total += @prices[item]
      end
    end
    @total = @total - (@total * (@discount / 100.00)) if @discount_applied == true
    @total
  end

  def total=(total)
    @set_total = total
  end

  def apply_discount
    @discount_applied = true
    if @discount <= 0
      return "There is no discount to apply."
    else
      return "After the discount, the total comes to $#{(self.total).to_i}."
    end
  end

  def void_last_transaction
    @items.pop
  end

end

=begin
cash_register = CashRegister.new(20)
cash_register.add_item("Lucky Charms", 4.5)
cash_register.total
cash_register.add_item("Ritz Crackers", 5.0)
cash_register.total
cash_register.add_item("macbook air", 1000)
cash_register.apply_discount

=end
