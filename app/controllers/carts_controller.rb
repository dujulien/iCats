class CartsController < ApplicationController
before_action :authenticate_user!
	def index
	end

	def show
		@cart = Cart.find(params[:id])
		@order = Order.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
    @order = current_cart
    @order_item = @order.joint_table_order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.joint_table_order_items
	end

end
