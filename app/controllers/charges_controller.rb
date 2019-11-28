class ChargesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def new
  end

  def create
    # Amount in cents
    @amount = (current_user.cart.total_price * 100).to_i

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    #Create a new order
    Order.create(stripe_id: params[:stripeToken], user: current_user)
    
    #Create order content
    current_user.cart.items.each do |item|
      JointTableOrderItem.create(order: Order.find_by(stripe_id: params[:stripeToken]), item: item)
    end

    UserMailer.order_email(current_user).deliver_now

    current_user.cart.empty_cart
    
    
    redirect_to :controller => 'items', :action => 'index'
  end

end



