class CartsController < ApplicationController


	before_action :authenticate_user!, only: [:create, :show]

	def index
	end

	def show
		@cart = Cart.find_by(user: current_user)
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
