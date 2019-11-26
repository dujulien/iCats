class Item < ApplicationRecord
	has_many :cart_contents
	has_many :carts, through: :cart_contents
end
