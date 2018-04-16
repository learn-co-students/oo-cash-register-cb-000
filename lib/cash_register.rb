class CashRegister
  @@all=[]

  attr_accessor :total,:discount,:last_item

  #Class reader
  def self.all
    @@all
  end

  def initialize(discount=0)
    @total=0
    @discount=discount
    #To clear out any previously added items when initializing new Class
    @@all.clear

    #Overly complicated code, works but too long
    #I thought *discount indicated that argument is optionally
    #but maybe not.
    #def initialize(*discount)
    #if discount != nil
      #I don't know why but discount the argument passed to
      #initialize, is an array [20] so have to join it into
      #a string and then convert the string to an integer
      #Seems weird to do so many conversions.
      #@discount=discount.join.to_i
    #else
      #@discount=0
    #end
  end

  def add_item(item,price,quantity=1)
    #This works too
    #self.total+=price*quantity
    #self.last_item=price*quantity

    @total+=price*quantity

    #To store the cost of the most recently added item
    #for the void_last_transaction method
    @last_item=price*quantity


    i=0
    while i<quantity
      @@all<<item
      i+=1
    end
  end

  def apply_discount
    if @discount != 0
      #If you divide an integer: 80 by a float: 100.0
      #you get a float: 0.8 without having to convert
      #integers to floats and vice versa
      @total*=((100-@discount)/100.0)#.to_f
      #@total=800.0 so convert it back to integer
      @total=@total.to_int
      #self.total.to_i

      #Don't use puts because rspec expects to return a string
      #expect(cash_register_with_discount.apply_discount).to eq("After the discount, the total comes to $800.")
      "After the discount, the total comes to $#{@total}."#{}.to_i}."
    else
      #Don't use puts because rspec expects to return a string
      #expect(cash_register.apply_discount).to eq("There is no discount to apply.")
      "There is no discount to apply."
    end
  end

  def items
    #Either code works
    #@@all
    self.class.all
  end

  def void_last_transaction
    #This works too
    #self.total-=self.last_item
    @total-=@last_item
  end

end
