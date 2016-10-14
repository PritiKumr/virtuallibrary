class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :checkout]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = @order.cart
    @cart_books = @cart.cart_books
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def select_shipping_address
    respond_to do |format|
      format.html
    end
  end

  def new_address
    respond_to do |format|
      format.html
    end
  end

  def summary
    if params[:address_id].present?
      @address = Address.find(params[:address_id])
    else
      @address = Address.create(
        params[:first_name],
        params[:last_name],
        params[:company_name],
        params[:contact_no],
        params[:new_address],
        params[:house_no],
        params[:district],
        params[:zipcode],
        params[:city],
        params[:special_notes]
      )
    end
    @cart = current_user.carts.active
    @cart_books = @cart.cart_books
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = Order.create(
    #   user_id: current_user.id,
    #   value: @cart.value,
    #   cart_id: @cart.id,
    #   status: "Packed from warehouse."
    # )
    respond_to do |format|
        format.html { redirect_to home_url, notice: 'Yayy!! you have rented your books.' }
        format.json { render :show, status: :created, location: @order }
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    @cart_books = @cart.cart_books
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_cart
      @cart = Cart.find(params[:cart_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :value, :status)
    end
end
