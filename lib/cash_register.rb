class CashRegister
    attr_accessor :total, :discount, :last_transaction

   def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
    @items = [] #["eggs", "tomato", "tomato", "tomato"]
    @last_transaction = {} #hash of item, transaction_amount
   end

   def items
     @items
   end

   def add_item(*params)
    #parse parameters
    item_qty = 1
    item_name = params[0]
    item_cost = params[1]
    if params.length == 3
        item_qty = params[2]
        for x in 0..item_qty-1
            @items.push(item_name)
            puts("Items:  #{@items}")
        end
      else
        @items.push(item_name)
    end

    #add item
    @last_transaction.clear
    @last_transaction[item_name] = (item_cost * item_qty)
    @total = @total + (item_cost * item_qty)
    @total
   end

   def void_last_transaction
     key, value = @last_transaction.first
     @last_transaction.clear
     @total 
   end

   def apply_discount
    retStr = ""

    if @discount == 0
        retStr = "There is no discount to apply."
    else
        @total =  @total - (@total * @discount/100)
        retStr = sprintf("After the discount, the total comes to $%d.",@total)
    end

    retStr

   end

   def void_last_transaction
     key, value = @last_transaction.first
     @last_transaction.clear
     @items.pop
     @total = @total - value
    end

end
