class OrdersController < ApplicationController
  def show
		@order = Order.find_by(user_id: 2)
	end
end
