class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items= []
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        @price = price
        @quantity = quantity
        self.total += (price * quantity)
        @transaction = quantity * price
        quantity.times{@items << title}
    end

    def apply_discount
        if @discount != 0
            @total = @total - ((@discount.to_f/100)* @price).to_i
            @price = (1 - @discount/100) * @price
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @transaction
    end


end
