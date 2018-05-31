class CashRegister
  attr_accessor :total, :employee_discount, :items



  def initialize(employee_discount = nil)
    @total = 0
    @employee_discount = employee_discount
    @items = []
    @purchases = {}
  end

  def total
    @total
  end

  def discount
    @employee_discount
  end

  def add_item(title, price, quantity = nil)
    @purchases[title]=0
    if quantity == nil
    @items.push(title)
    @total += price
    else
      @total += (price * quantity)
      i = 0
      while i < quantity
        @items.push(title)
        i += 1
      end
    end
    @purchases[title] += price
  end

  def apply_discount
    if @employee_discount != nil
    @total -= @employee_discount
    "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @purchases.values.last

  end
end

# cash = CashRegister.new(20)
# cashh = CashRegister.new()
#
# purchases = {}
# purchases["tomatoes"] = 0
# purchases["cucumber"] = 2
#
# cash_register_with_discount = CashRegister.new(200)
#
# cash_register_with_discount.add_item("macbook air", 1000)
# cash_register_with_discount.items
#
# cash_register_with_discount.apply_discount
# expect(cash_register_with_discount.total).to eq(800)
