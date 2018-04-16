class CashRegister
  @@all=[]

  attr_accessor :total,:discount,:last_item

  def initialize(*discount)
    @total=0
    @@all.clear #To clear out any previously added items
    if discount != nil
      @discount=discount.join.to_i
    else
      @discount=0
      #puts "There is no discount to apply."
    end
  end

  def add_item(item,price,quantity=1)
    self.total+=price*quantity
    self.last_item=price*quantity

    i=0
    while i<quantity
      @@all<<item
      i+=1
    end
  end

  def apply_discount
    if @discount != 0
      self.total*=((100-@discount)/100.0)#.to_f
      #self.total.to_i
      "After the discount, the total comes to $#{@total.to_i}."
    elsif @discount==0
      "There is no discount to apply."
    end
  end

  def items
    @@all
  end

  def void_last_transaction
    self.total-=self.last_item
  end










end
