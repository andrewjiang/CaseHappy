class PagesController < ApplicationController

  def choose
  end

  def home
  end

  def popular
  	@by = params[:by]

  	if @by == "latest"
  		@orders = Order.where(share: true).order('updated_at DESC').limit(8)
  		@latest = "active"
  	elsif @by == "editor"
  		@orders = Order.where(share: true, user: 'editor').order('created_at').limit(8)
  		@editor = "active"
  	else
  		@orders = Order.where(share: true).limit(8)
  		@popular = "active"
  	end

  end



end
