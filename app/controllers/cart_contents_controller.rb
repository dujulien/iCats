class CartContentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def create
		@item = Item.find(params[:item_id])
		puts "$"*20
		puts @item
		puts "$"*20	
		@cart = Cart.find_by(user: current_user)
		puts "$"*20
		puts @cart
		puts "$"*20
		CartContent.create(cart: @cart, item: @item)
		redirect_to root_path
	end

end
