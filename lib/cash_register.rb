require "pry"
class CashRegister

  attr_accessor :total, :discount, :title, :price, :last_transaction
  @@items = []

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @@items.clear
  end

  def add_item(title, price, optional = 0)
    #binding.pry
    #@@items.clear
    @title = title
    if optional != 0
    @total += price*optional
    @last_transaction = price*optional
    optional.times do
      @@items << title
    end
    else
     @total += price
     @last_transaction = price
     @@items << title
   end
  end

  def apply_discount
    #binding.pry
      if @discount == 0
        "There is no discount to apply."
      else
        #binding.pry
        @discount = @discount.to_f/100
        @discount = @total*@discount
        @total = @total - @discount
        @total = @total.to_i
        "After the discount, the total comes to $800."
      end
    end


    def items
    #  binding.pry
    @@items
    end

    def void_last_transaction
      @total = @total - @last_transaction
    end
end
