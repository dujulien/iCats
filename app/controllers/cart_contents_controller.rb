class CartContentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@item = Item.find(params[:item_id])
		@cart = Cart.find_by(user: current_user)
		CartContent.create(cart: @cart, item: @item)
    redirect_to request.referrer
	end

	def destroy
		@cart_content = CartContent.find(params[:id])
		@cart_content.destroy
	end

end
