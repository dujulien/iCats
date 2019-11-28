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
      @user = current_user
      @cart = @user.cart
      @content = @cart.items
      #confirmation stripe
      #confirmation save
  		#Création de l'order
      #vider le panier
      UserMailer.order_email(@user).deliver_now
      redirect_to root_path
  	end

  	def edit
  	end

  	def update
  	end

  	def destroy
  	end

end
