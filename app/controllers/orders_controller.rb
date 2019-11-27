class OrdersController < ApplicationController

    before_action :authenticate_user!

  	def index
  		@orders = Orders.all
  	end

  	def show
  		@order = Order.find(params[:id])
  		@ordered_items = JointTableOrderItem.where(order_id: @order.id)
  		@purchase = []
      	@ordered_items.each do |item|
        		@purchase << Item.find(item.item_id)
      	end
  	end    

  	def new
  	end

  	def create
  		@order = Order.create
  	end

  	def edit
  	end

  	def update
  	end

  	def destroy
  	end

end
