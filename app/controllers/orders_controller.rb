class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :cancel]
  before_action :set_cart, only: [:create]

  # GET /orders
  # GET /orders.json
  def index
    orders = current_user.orders
    @pending_orders = orders.pending
    @delivered_orders = orders.delievered
    @return_pending = orders.return_pending
    @completed_orders = orders.completed
    @canceled_orders  = orders.canceled
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
      shippping_addr = {
        first_name: params[:address][:first_name],
        last_name: params[:address][:last_name],
        company_name: params[:address][:company_name],
        full_address: params[:address][:full_address],
        contact_no: params[:address][:contact_no],
        house_no: params[:address][:house_no],
        city: params[:address][:city],
        district: params[:address][:district],
        pincode: params[:address][:pincode]
      }
      @address = Address.add_shipping_addr(current_user, shippping_addr)
    end
    @cart = current_user.carts.active
    @cart_books = @cart.cart_books
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.create(
      value: @cart.value,
      paid_amt: params[:amount].to_i,
      status: 0,
      cart_id: @cart.id,
      inv_no: Order.inv_no,
      address_id: params[:address_id]
    )
    respond_to do |format|
        format.html { redirect_to @order, notice: 'Yayy!! you have rented your books.' }
        # format.json { render :show, status: :created, location: @order }
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

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel
    @order.update status: 3, canceled_date: Time.now
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Your order has been canceled.' }
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
