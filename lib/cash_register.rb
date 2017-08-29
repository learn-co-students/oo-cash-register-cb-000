class CashRegister
  @@item_list = []
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_item = []
  end

  def add_item(item, price, quantity = nil)
    self.last_item_tracker(item, price, quantity)
    if quantity
      @total += price * quantity
      self.items.concat(Array.new(quantity, item))
    else
      @total += price
      self.items << item
    end
  end

  def apply_discount
    if self.discount
      @total = @total * (100 - self.discount)/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def last_item_tracker(item, price, quantity = nil)
    if self.last_item.size == 0 && self.items == 0
      self.last_item
    else
      self.last_item[0] = item
      self.last_item[1] = price
      quantity == nil ? self.last_item[2] = 1 : self.last_item[2] = quantity
    end
  end

  def void_last_transaction
    @total = self.total - self.last_item[1]*self.last_item[2]
  end
end
