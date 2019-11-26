class CartsController < ApplicationController
	
	def index
	end

	def show
		@cart = Cart.find_by(user_id: 2)
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
	end

end
