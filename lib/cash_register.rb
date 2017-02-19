class CashRegister

	attr_accessor :total, :discount, :items

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def total
		@total
	end

	def add_item(title, price, quantity = 1)
		@total = @total + (price * quantity)
		@price = price
		quantity.times {@items.push(title)}
	end

	def apply_discount
		#convert discount into percentage
		discount_percentage = (@discount/100.0)*@total
		@total = @total - discount_percentage
		@total = @total.floor
		if discount_percentage == 0 
			"There is no discount to apply."
		elsif discount_percentage > 0 
		"After the discount, the total comes to $#{@total}."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		@total = @total - @price
	end

end