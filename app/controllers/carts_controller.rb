class CartsController < ApplicationController
  before_action :set_cart, only: [:show,:edit, :update, :destroy, :thankyou]
  
  # GET /carts
  # GET /carts.json
  #def index
  #  @carts = Cart.all
  #end

  # GET /carts/1
  # GET /carts/1.json
  def show

    @code = params[:code]

    @cart = Cart.find(params[:id])

    if @code == "REDDIT"
      @discount = 0.75
      @discount_tag = "REDDIT discount applied (25% off!)"
    elsif @code == "MAY14"
      @discount = 0.75
      @discount_tag = "Google Ad Discount (25% off!)"
    else
      puts 'Nil'
      @discount = 1
      @discount_tag = ""
    end

    @cart.update_attribute(:discount, 1 - @discount)

    @session_id = request.session_options[:id]

    if @session_id == @cart.session || @code == "admin"
      @orders = Order.where(cart: params[:id])
      @cart_total = @orders.sum("quantity * price")
      @cart_items = @orders.sum("quantity")
      @cart.update_attribute(:total, @cart_total * @discount)
    else
      redirect_to(root_url) 
    end

  end

  # GET /carts/new
  #def new
  #  @cart = Cart.new
  #end

  # GET /carts/1/edit
  #def edit
  #  @cart = Cart.find(params[:id])
  #  @session_id = request.session_options[:id]
  #  redirect_to(root_url) unless @session_id == @cart.session
  #end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user, :session, :total, :discount, :paid)
    end

end
