require 'pry'
class CashRegister
    attr_accessor :total, :oldTotal
    attr_reader :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @oldTotal = 0
    end

    def add_item(title, price, quantity = 1)
        self.oldTotal = self.total
        self.total += price * quantity
        items.fill(title, items.length, quantity)
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.total * self.discount/100)
            "After the discount, the total comes to $#{self.total}."
        else
            'There is no discount to apply.'
        end
    end

    def void_last_transaction
        self.total = self.oldTotal
    end

end

