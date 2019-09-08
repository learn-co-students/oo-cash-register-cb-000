class CashRegister
    attr_accessor :total, :discount, :items, :price

    def initialize(discount = 0)
      @items = []
      @discount = discount
      @total = 0.0
    end

    def cash_register
      CashRegister.new
    end

    def cash_register_with_discount(discount)
      CashRegister.new(discount)
    end

    def discount
      @discount = 20
    end

    def add_item(item, price, quantity = 1)
      @price = price
      cnt = 1
      while cnt <= quantity
        @items << item
        cnt += 1
      end
      @total += (price * quantity)
    end

    def apply_discount
      if @discount > 0
        @total *= (1 - @discount.fdiv(100))
        "After the discount, the total comes to $#{@total.floor}."
      else
        "There is no discount to apply."
      end
    end

    def items
      @items
    end

    def void_last_transaction
      @total -= @price
    end

end
