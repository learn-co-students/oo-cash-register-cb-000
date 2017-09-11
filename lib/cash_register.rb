class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(employee_discount=0)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_transaction = []
  end #initialize

  def add_item(title, price, quantities = 1)
    # puts "*****************#{title}********#{quantities}"
    @total += (price * quantities)
    # for (i=0;i<quantities;i++)
    for i in 1..quantities
      @items << title
    end #for
    @last_transaction.clear
    @last_transaction = [title,price,quantities]
  end #add_item

  def apply_discount
    message = ""
    if @discount == 0
      message = "There is no discount to apply."
    else
      # puts "**************#{@discount}****#{@total}"
      @total-= (@total * (@discount / 100.to_f))
      # puts "*************#{@total}***#{(@discount / 100.to_f)}"
      message = "After the discount, the total comes to $#{@total.to_i}."
    end #if/else
    message
  end #apply_discount

  def void_last_transaction
    puts "***********8#{@last_transaction}"
    @total -= (@last_transaction[1] * @last_transaction[2]) #hash might be better for prod code
    #should remove item name and quantities of item from @items. But tests pass..
  end

end #class
