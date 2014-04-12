class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :set_cart

  def set_cart
		@session_id = request.session_options[:id]
		puts @session_id
		@cart = Cart.find_by session: @session_id
		if @cart == nil
			puts current_user
			puts "Nil"
			if current_user == nil
				@user =  "guest" + @session_id
				puts @user
				@cart = Cart.new(session: @session_id, user: "guest" + @session_id)
			else
				@user =  current_user.email
				@cart = Cart.new(session: @session_id, user: current_user)
			end
			@cart.save
		else
			puts @cart.session
			puts "oops"
		end
		puts @cart.id
		@cart_items = Order.where(cart: @cart.id).count
		puts @cart_items
  end

end
