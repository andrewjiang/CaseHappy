class ChargesController < ApplicationController

	def new
	end

	def create

    @session_id = request.session_options[:id]
    @cart = Cart.find_by session: @session_id

	  # Amount in cents
	  @amount = '%.0f' % (@cart.total * 100)

	  customer = Stripe::Customer.create(
	    :email => params[:email],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'New CaseHappy Order',
	    :currency    => 'usd'
	  )

	  @cart.update_attribute(:session, "Paid")
	  @cart_items = 0

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
