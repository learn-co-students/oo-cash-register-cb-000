require "pry"

class CashRegister
	@total = 0
	@items = []
	@last = 0
	
	attr_reader :discount
	attr_accessor :total, :items, :last

	def initialize(discount = nil)
		@total = 0
		@discount = discount
		@items = []
	end

	def total
		@total
	end

	def add_item(title, price, amount = 1)
		@total += (price * amount)
		@last = (price * amount)
		counter = 0
		while (counter < amount)
		 	@items << title
		    counter += 1
		end
		
	end

	def apply_discount
		if(@discount != nil) 
			discount_percentage = (@discount/100.0)*@total
			@total = @total - discount_percentage
			"After the discount, the total comes to $#{@total.floor}."
		else
			"There is no discount to apply."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		@total -= @last
	end


end
