class Item < ApplicationRecord
	has_many :cart_contents
		has_many :carts, through: :cart_contents

	has_many :joint_table_order_items
		has_many :orders, through: :joint_table_order_items
end
