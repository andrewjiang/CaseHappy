class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  #def index
  #  @orders = Order.all
  #end

  # GET /orders/1
  # GET /orders/1.json
  def show

    @code = params[:code]
    
    @order = Order.find(params[:id])
    @cart = Cart.find(@order.cart)
    @session_id = request.session_options[:id]
    if @session_id == @cart.session || @code == "admin"
      render layout: 'display'
    else
      redirect_to(root_url)
    end

    
  end

  # GET /orders/new
  def new
    @model = params[:model]
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

    @code = params[:code]

    @order = Order.find(params[:id])
    @cart = Cart.find(@order.cart)
    @session_id = request.session_options[:id]
    if @session_id == @cart.session || @code == "admin"

    else
      redirect_to(root_url)
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save

        if params[:commit] == "save"
          format.html { redirect_to edit_order_path(@order) }
          format.json { render action: 'edit', status: :created, location: @order }
        else
          format.html { redirect_to @cart }
          format.json { render action: 'show', status: :created, location: @cart }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    respond_to do |format|
      if @order.update(order_params)

        if params[:commit] == "save"
          format.html { redirect_to edit_order_path(@order) }
          format.json { head :no_content }
        else
          format.html { redirect_to @cart }
          format.json { head :no_content }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to @cart }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user, :quantity, :canvas, :model, :offset, :startW, :image, :cart, :price)
    end
end
