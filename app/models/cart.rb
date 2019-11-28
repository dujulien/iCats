class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_contents
	has_many :items, through: :cart_contents

	def total_price
		total_price = 0
		self.items.each do  |item|
			total_price += item.price
		end
		total_price.round(2)
	end

	def empty_cart
		self.cart_contents.each do |content| 
			content.destroy
		end
	end
end
