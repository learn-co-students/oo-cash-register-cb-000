class CashRegister
  def initialize(employee_discount = nil)
    @total = 0
    @discount = employee_discount
    @purchased_stuff = []
  end
  def total=(input_total)
    @total = input_total
  end
  def total
    @total
  end
  def discount
    @discount
  end
  def add_item(item, cost, multiplier = 1)
    complete_cost = cost * multiplier
    @total = @total + complete_cost
    @last_transaction = []
    @last_transaction = [item, cost, multiplier]
    multiplier.times do
      @purchased_stuff << item
    end
  end
  def apply_discount
    if @discount != nil
      step_one = 100 - @discount
      adjusted_percentage = step_one / 100.00
      step_two = @total * adjusted_percentage
      if step_two.class == Float
        final_total = step_two.to_i
      elsif step_two.class == Fixnum
        final_total = step_two
      end
      @total = final_total
      "After the discount, the total comes to $#{final_total}."
    else
      "There is no discount to apply."
    end
  end
  def items
    @purchased_stuff
  end
  def void_last_transaction
    complete_cost = @last_transaction[1] * @last_transaction[2]
    @total = @total - complete_cost
    @last_transaction[2].times do
      @purchased_stuff.delete_at(@purchased_stuff.index(@last_transaction[0]))
    end
  end
end

register = CashRegister.new(20)
register.add_item("macbook air", 1000)
puts register.total
puts register.apply_discount
puts register.total
